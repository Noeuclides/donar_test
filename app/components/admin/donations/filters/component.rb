# :nocov:
class Admin::Donations::Filters::Component < ApplicationComponent
  def initialize(options: {}, components_options: {})
    @filter = options[:filter]
  end

end
# :nocov:
