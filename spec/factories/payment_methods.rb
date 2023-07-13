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
FactoryBot.define do
  factory :payment_method do
    holder { nil }
    franchise { 1 }
    card_token { Faker::String.random(length: 10) }
  end
end
