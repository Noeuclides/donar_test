# == Schema Information
#
# Table name: campaigns
#
#  id           :bigint           not null, primary key
#  discarded_at :datetime
#  end_date     :datetime
#  name         :string
#  start_date   :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_campaigns_on_discarded_at  (discarded_at)
#
FactoryBot.define do
  factory :campaign do
    name { "MyString" }
    start_date { "2023-07-06 09:30:13" }
    end_date { "2023-07-06 09:30:13" }
    discarded_at { "2023-07-06 09:30:13" }
  end
end
