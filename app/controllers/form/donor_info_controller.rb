class Form::DonorInfoController < ApplicationController
  def index
  end

  def validate
    @form = DonorInfoForm.new(donor_info_form_params)
    if @form.valid?
      session[params_key] = donor_info_form_params.to_h.merge({ ip: request.ip, user_agent: request.user_agent })

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


  def donor_info_form_params
    params.require(params_key)
          .permit(:first_name, :last_name, :email, :phone_number, :birthdate)
  end

  def params_key
    DonorInfoForm.model_name.param_key.to_sym
  end
end
