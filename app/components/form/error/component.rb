# frozen_string_literal: true

class Form::Error::Component < ApplicationComponent

  def initialize(options: {}, component_options: {})
    @error = options[:error]
  end
end
