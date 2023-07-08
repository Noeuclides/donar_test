class Form::DonationAmountController < ApplicationController
  def index
  end

  def validate
    @form = DonationAmountForm.new(donation_amount_form_params)
    if @form.valid?
      session[params_key] = donation_amount_form_params.to_h

      respond_to do |format|
        format.turbo_stream { render :'form/donor_info/valid', status: 200, locals: { form: DonorInfoForm.new }  }
      end
    else
      respond_to do |format|
        format.turbo_stream { render :'form/invalid', status: :unprocessable_entity, locals: { error: @form.errors.first.message }  }
      end
    end
  end

  private


  def donation_amount_form_params
    params.require(params_key).permit(:amount)
  end

  def params_key
    DonationAmountForm.model_name.param_key.to_sym
  end
end
