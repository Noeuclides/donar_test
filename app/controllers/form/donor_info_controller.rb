class Form::DonorInfoController < Form::BaseController
  def validate
    @form = DonorInfoForm.new(donor_info_form_params)

    if @form.valid?
      session[params_key] = donor_info_form_params.to_h.merge({ ip: request.ip, user_agent: request.user_agent })
      render_valid_form(:'form/payment_method', form: PaymentMethodForm.new)
    else
      render_invalid_form(@form.errors.first.message)
    end
  end

  private

  def donor_info_form_params
    params.require(params_key)
          .permit(:first_name, :last_name, :email, :phone_number, :birthdate)
  end

end
