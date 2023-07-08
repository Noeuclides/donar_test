# == Schema Information
#
# Table name: donations
#
#  id                :bigint           not null, primary key
#  amount_cents      :integer          default(0), not null
#  amount_currency   :string           default("USD"), not null
#  discarded_at      :datetime
#  ip                :string           not null
#  payment_date      :datetime
#  status            :integer          not null
#  user_agent        :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  campaign_id       :bigint
#  donor_id          :bigint           not null
#  payment_method_id :bigint           not null
#
# Indexes
#
#  index_donations_on_campaign_id        (campaign_id)
#  index_donations_on_discarded_at       (discarded_at)
#  index_donations_on_donor_id           (donor_id)
#  index_donations_on_payment_method_id  (payment_method_id)
#
# Foreign Keys
#
#  fk_rails_...  (campaign_id => campaigns.id)
#  fk_rails_...  (donor_id => donors.id)
#  fk_rails_...  (payment_method_id => payment_methods.id)
#
FactoryBot.define do
  factory :donation do
    donor { nil }
    payment_method_references { "MyString" }
    campaign { nil }
    status { 1 }
    ip { "MyString" }
    payment_date { "2023-07-06 10:13:25" }
  end
end
