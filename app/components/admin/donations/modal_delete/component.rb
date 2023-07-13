class Admin::Donations::ModalDelete::Component < ApplicationComponent

    def initialize(options: {})
        @donation_id = options[:donation_id]
    end
end