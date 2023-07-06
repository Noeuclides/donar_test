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
class Campaign < ApplicationRecord
  include Discard

  has_many :donations, class_name: Donation.name

  validates :name, presence: true, uniqueness: true

end
