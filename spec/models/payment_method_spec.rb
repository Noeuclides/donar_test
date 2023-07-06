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
require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do
  describe "fields" do
    it { should have_db_column(:franchise).of_type(:integer) }
  end

  describe "Associations" do
    it { should belong_to(:holder).class_name(Donor.name) }
    it { should have_many(:donations).class_name(::Donation.name) }
    it { should have_many(:payment_method_inscriptions).class_name(PaymentMethod::Inscription.name) }
  end

  describe "enums" do
    it { should define_enum_for(:franchise).with_values(visa: 0,
                                                        mastercard: 1,
                                                        american_express: 2,
                                                        diners_club: 3) }
  end

  describe "validations" do
    it { should validate_presence_of(:franchise) }
  end
end
