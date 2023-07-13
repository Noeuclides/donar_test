# frozen_string_literal: true

# :nocov:
class Admin::Donations::Table::Component < ApplicationComponent

  def initialize(options: {}, components_options: {})
    @items = options[:items]
  end
  
end
# :nocov: