# == Schema Information
#
# Table name: donors
#
#  id              :bigint           not null, primary key
#  birthdate       :datetime
#  discarded_at    :datetime
#  document_number :string
#  document_type   :string
#  email           :string
#  first_name      :string
#  last_name       :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_donors_on_discarded_at  (discarded_at)
#
require 'rails_helper'

RSpec.describe Donor, type: :model do

  describe "fields" do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:first_name).of_type(:string) }
    it { should have_db_column(:last_name).of_type(:string) }
    it { should have_db_column(:document_type).of_type(:string) }
    it { should have_db_column(:document_number).of_type(:string) }
    it { should have_db_column(:phone_number).of_type(:string) }
    it { should have_db_column(:birthdate).of_type(:datetime) }
  end

  describe "Associations" do
    it { should have_many(:donations).class_name(::Donation.name) }
    it { should have_many(:payment_methods).class_name(::PaymentMethod.name) }
  end


  describe "validations" do
    subject { build(described_class.model_name.singular.to_sym) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:document_number) }
    it { should validate_uniqueness_of(:document_number).case_insensitive }
  end

end
