# == Schema Information
#
# Table name: transactions
#
#  id                            :bigint           not null, primary key
#  amount_cents                  :integer          default(0), not null
#  amount_currency               :string           default("USD"), not null
#  discarded_at                  :datetime
#  raw_response                  :jsonb
#  status                        :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  payment_method_inscription_id :bigint           not null
#
# Indexes
#
#  index_transactions_on_discarded_at                   (discarded_at)
#  index_transactions_on_payment_method_inscription_id  (payment_method_inscription_id)
#
# Foreign Keys
#
#  fk_rails_...  (payment_method_inscription_id => payment_method_inscriptions.id)
#
FactoryBot.define do
  factory :transaction do
    payment_method_inscription { nil }
    status { 1 }
    raw_response { "" }
  end
end
