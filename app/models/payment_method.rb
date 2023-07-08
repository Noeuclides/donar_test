# == Schema Information
#
# Table name: payment_methods
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  franchise    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  holder_id    :bigint           not null
#
# Indexes
#
#  index_payment_methods_on_discarded_at  (discarded_at)
#  index_payment_methods_on_holder_id     (holder_id)
#
# Foreign Keys
#
#  fk_rails_...  (holder_id => donors.id)
#
class PaymentMethod < ApplicationRecord
  include Discard

  belongs_to :holder, class_name: Donor.name
  has_many :donations, class_name: Donation.name
  has_many :payment_method_inscriptions, as: :payment_method, class_name: PaymentMethod::Inscription.name, dependent: :destroy

  #===== Enums
  enum franchise: { visa: 0,
                    mastercard: 1,
                    american_express: 2,
                    diners_club: 3 }

  validates :franchise, presence: true
end
