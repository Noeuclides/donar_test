# == Schema Information
#
# Table name: payment_methods
#
#  id           :bigint           not null, primary key
#  card_token   :string           not null
#  discarded_at :datetime
#  franchise    :integer
#  holder_type  :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  holder_id    :bigint           not null
#
# Indexes
#
#  index_payment_methods_on_discarded_at  (discarded_at)
#  index_payment_methods_on_holder        (holder_type,holder_id)
#
class PaymentMethod < ApplicationRecord
  include Discard

  belongs_to :holder, polymorphic: true
  has_one :donation, class_name: Donation.name
  has_many :transactions, class_name: Transaction.name

  #===== Enums
  enum franchise: { visa: 0,
                    mastercard: 1,
                    american_express: 2,
                    diners_club: 3 }

  validates :franchise, presence: true
end
