class Form::PaymentMethodController < ApplicationController
  def index
  end

  def validate
    @form = PaymentMethodForm.new(payment_method_form_params.merge({card_token: "dasdasd"}))
    if @form.valid?
      session[params_key] = payment_method_form_params.to_h

      donation = CreateDonationService.new(session.instance_variable_get(:@delegate))
      TransactionService.new(donation, payment_method_form_params[:card_token])
      # servicio para realizar transacción (pasarela de pago)
      respond_to do |format|
        format.turbo_stream { render :'form/payment_method/valid', status: 200, locals: { form: PaymentMethodForm.new }  }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :'form/invalid', status: :unprocessable_entity, locals: { error: @form.errors.first.message }  }
      end
    end
  end

  private


  def payment_method_form_params
    params.require(params_key)
          .permit(:card_token, :document_type, :document_number)
  end

  def params_key
    PaymentMethodForm.model_name.param_key.to_sym
  end
end
