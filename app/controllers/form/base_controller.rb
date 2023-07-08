class Form::BaseController < ApplicationController
  private

  def params_key
    "#{controller_name.classify}Form".constantize.model_name.param_key.to_sym
  end

  def render_valid_form(partial, locals = {})
    respond_to do |format|
      format.turbo_stream { render partial, status: 200, locals: locals }
    end
  end

  def render_invalid_form(error_message)
    respond_to do |format|
      format.turbo_stream { render :'form/invalid', status: :unprocessable_entity, locals: { error: error_message } }
    end
  end
end