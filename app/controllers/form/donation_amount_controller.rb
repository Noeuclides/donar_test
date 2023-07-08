class Form::DonationAmountController < Form::BaseController
  def validate
    @form = DonationAmountForm.new(donation_amount_form_params)
    if @form.valid?
      session[params_key] = donation_amount_form_params.to_h

      render_valid_form(:'form/donor_info', form: DonorInfoForm.new)
    else
      respond_to do |format|
        format.turbo_stream { render :'form/invalid', status: :unprocessable_entity, locals: { error: @form.errors.first.message } }
      end
    end
  end

  private

  def donation_amount_form_params
    params.require(params_key).permit(:amount)
  end

end
