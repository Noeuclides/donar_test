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
require 'rails_helper'

RSpec.describe Campaign, type: :model do
  describe "fields" do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:start_date).of_type(:datetime) }
    it { should have_db_column(:end_date).of_type(:datetime) }
  end

  describe "Associations" do
    it { should have_many(:donations).class_name(Donation.name) }
  end


  describe "validations" do
    subject { build(described_class.model_name.singular.to_sym) }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end
end
