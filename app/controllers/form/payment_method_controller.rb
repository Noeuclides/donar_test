class Form::PaymentMethodController < Form::BaseController
  def validate
    @form = PaymentMethodForm.new(payment_method_form_params.merge({ card_token: "dasdasd" }))
    if @form.valid?
      session[params_key] = payment_method_form_params.to_h

      process_donation

      render_valid_form(:'form/payment_method/valid', message: "Gracias por tu donación")
    else
      render_invalid_form(@form.errors.first.message)
    end
  end

  private

  def payment_method_form_params
    params.require(params_key)
          .permit(:card_token, :document_type, :document_number)
  end

  def process_donation
    donation_service = CreateDonationService.new(
      donation_params: session_params[:donation_amount_form],
      donor_params: session_params[:donor_info_form],
      payment_method_params: session_params[:payment_method_form])
    transaction_service = TransactionService.new(donation_service, payment_method_form_params[:card_token])

    begin
      transaction_service.process_transaction
    rescue => e
      handle_error(e)
    end
  end

  def session_params
    session.instance_variable_get(:@delegate)
  end

  def handle_error(error)
    Rails.logger.error("An error occurred during donation processing: #{error.message}")

    render_invalid_form("An error occurred during donation processing.")
  end

end
