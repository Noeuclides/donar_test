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
require 'rails_helper'

RSpec.describe Donation, type: :model do
  describe "fields" do
    it { should have_db_column(:amount_cents).of_type(:integer) }
    it { should have_db_column(:amount_currency).of_type(:string) }
    it { should have_db_column(:status).of_type(:integer) }
    it { should have_db_column(:payment_date).of_type(:datetime) }
  end

  describe "Associations" do
    it { should belong_to(:donor).class_name(Donor.name) }
    it { should belong_to(:payment_method).class_name(PaymentMethod.name) }
    it { should belong_to(:campaign).class_name(Campaign.name) }
  end

  describe "enums" do
    it { should define_enum_for(:status).with_values(created: 0,
                                                     in_process: 1,
                                                     collected: 2,
                                                     canceled: 4,
                                                     rejected: 5) }
  end

end
