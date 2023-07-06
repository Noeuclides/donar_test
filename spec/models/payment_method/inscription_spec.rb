# == Schema Information
#
# Table name: payment_method_inscriptions
#
#  id                  :bigint           not null, primary key
#  card_token          :string           not null
#  discarded_at        :datetime
#  payment_method_type :string           not null
#  status              :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  payment_method_id   :bigint           not null
#
# Indexes
#
#  index_payment_method_inscriptions_on_discarded_at    (discarded_at)
#  index_payment_method_inscriptions_on_payment_method  (payment_method_type,payment_method_id)
#
require 'rails_helper'

RSpec.describe PaymentMethod::Inscription, type: :model do
  describe "fields" do
    it { should have_db_column(:card_token).of_type(:string) }
    it { should have_db_column(:status).of_type(:integer) }
  end

  describe "Associations" do
    it { should belong_to(:payment_method) }
    it { should have_many(:transactions).class_name(Transaction.name) }
  end

  describe "enums" do
    it { should define_enum_for(:status).with_values(created: 0,
                                                        in_process: 1,
                                                        active: 2,
                                                        deleted:3,
                                                        canceled: 4,
                                                        rejected: 5,
                                                        expired: 6 ) }
  end
end
