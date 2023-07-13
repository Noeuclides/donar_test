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
require 'rails_helper'

RSpec.describe PaymentMethod, type: :model do
  describe "fields" do
    it { should have_db_column(:franchise).of_type(:integer) }
  end

  describe "Associations" do
    it { should belong_to(:holder) }
    it { should have_one(:donation).class_name(::Donation.name) }
    it { should have_many(:transactions).class_name(Transaction.name) }
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
