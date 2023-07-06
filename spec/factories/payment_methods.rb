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
FactoryBot.define do
  factory :payment_method do
    holder { nil }
    franchise { 1 }
  end
end
