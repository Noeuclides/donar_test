# frozen_string_literal: true

class ApplicationReflex < StimulusReflex::Reflex
  include Pagy::Backend

  delegate :current_admin, to: :connection
end
