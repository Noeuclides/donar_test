class Form::PaymentMethodController < Form::BaseController


  def validate
    @form = PaymentMethodForm.new(payment_method_form_params)
    if @form.valid?
      session[params_key] = payment_method_form_params.slice(:card_token, :franchise)

      process_donation

      flash[:message] = "Gracias por Donar"
      redirect_to campaign_donaton_path, status: :see_other
    else
      flash[:message] = "Algo salió mal"
      redirect_to campaign_donaton_path, status: :see_other
    end
  end

  private

  def payment_method_form_params
    permited_params = params.require(params_key)
          .permit(:card_token, :document_type, :document_number, :franchise)
    permited_params[:franchise] = permited_params[:franchise].to_i if permited_params[:franchise].present?
    permited_params
  end

  def process_donation
    begin
      donation = CreateDonationService.new(
        donation_params: session_params[:donation_amount_form],
        donor_params: session_params[:donor_info_form].merge(payment_method_form_params.to_h.slice(:document_number, :document_type)),
        payment_method_params: session_params[:payment_method_form]).create

      transaction_service = TransactionService.new(donation, payment_method_form_params[:card_token])

      transaction_service.create
    rescue => e
      debugger
      handle_error(e)
    end
  end

  def session_params
    session.instance_variable_get(:@delegate).with_indifferent_access
  end

  def handle_error(error)
    Rails.logger.error("An error occurred during donation processing: #{error.message}")

    render_invalid_form("An error occurred during donation processing.")
  end

end
