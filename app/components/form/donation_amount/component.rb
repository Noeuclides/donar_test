# frozen_string_literal: true

class Form::DonationAmount::Component < ApplicationComponent

  def initialize(options: {}, component_options: {})
    @form = options[:form]
    @error = options[:error]
  end
end
