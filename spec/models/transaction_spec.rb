# == Schema Information
#
# Table name: transactions
#
#  id                            :bigint           not null, primary key
#  amount_cents                  :integer          default(0), not null
#  amount_currency               :string           default("USD"), not null
#  discarded_at                  :datetime
#  raw_response                  :jsonb
#  status                        :integer
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  payment_method_inscription_id :bigint           not null
#
# Indexes
#
#  index_transactions_on_discarded_at                   (discarded_at)
#  index_transactions_on_payment_method_inscription_id  (payment_method_inscription_id)
#
# Foreign Keys
#
#  fk_rails_...  (payment_method_inscription_id => payment_method_inscriptions.id)
#
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "fields" do
    it { should have_db_column(:amount_cents).of_type(:integer) }
    it { should have_db_column(:amount_currency).of_type(:string) }
    it { should have_db_column(:status).of_type(:integer) }
    it { should have_db_column(:raw_response).of_type(:jsonb) }
  end

  describe "Associations" do
    it { should belong_to(:payment_method_inscription).class_name(PaymentMethod::Inscription.name) }
  end

  describe "enums" do
    it { should define_enum_for(:status).with_values(created: 0,
                                                        in_process: 1,
                                                        paid: 2,
                                                        canceled: 3,
                                                        rejected: 4 ) }
  end
end
