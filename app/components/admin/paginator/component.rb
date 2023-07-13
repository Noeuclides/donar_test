# :nocov:
class Admin::Paginator::Component < ApplicationComponent
  def initialize(options: {}, components_options: {})
    @filter = options[:filter]
    @pagy = options[:pagy]
    @reflex_action = options[:reflex_action]
  end
end
# :nocov:
