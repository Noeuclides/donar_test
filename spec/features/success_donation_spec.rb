require 'rails_helper'

RSpec.feature 'success donation', type: :feature do
  let(:donor) { build(:donor) }

  context 'when the donation form is filled successfully' do
    it 'creates a Donation' do
      stub_const('PaymentGateway::MercadoPagoDummyService::TRANSACTION_STATUSES', ['approved'])

      visit campaign_donaton_path

      success_donor_amount_form
      success_donor_info_form(donor)
      success_payment_method_form(donor)

      wait_for_donations_creation

      donation = Donation.first
      expect(donation).to be_a(Donation)
      expect(donation.payment_method).to be_a(PaymentMethod)
      expect(donation.payment_method.transactions.first).to be_a(Transaction)

      expect(ActionMailer::Base.deliveries.last.to).to contain_exactly(donation.donor.email)
      expect(ActionMailer::Base.deliveries.last.subject).to eq('Gracias por tu donación!')
      expect(page).to have_content 'Gracias por Donar'
    end
  end
end