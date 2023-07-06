# == Schema Information
#
# Table name: payment_method_inscriptions
#
#  id                  :bigint           not null, primary key
#  card_token          :string           not null
#  discarded_at        :datetime
#  payment_method_type :string           not null
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  payment_method_id   :bigint           not null
#
# Indexes
#
#  index_payment_method_inscriptions_on_discarded_at    (discarded_at)
#  index_payment_method_inscriptions_on_payment_method  (payment_method_type,payment_method_id)
#
class PaymentMethod::Inscription < ApplicationRecord
  include Discard

  #===== Enums
  enum status: { created: 0, in_process: 1, active: 2, deleted:3, canceled: 4, rejected: 5, expired: 6 }, _default: :created

  belongs_to :payment_method, polymorphic: true
  has_many :transactions, as: :payment_method_inscription, class_name: Transaction.name

end
