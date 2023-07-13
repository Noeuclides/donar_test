require 'rails_helper'

RSpec.describe CreateDonationService do
  describe '#create' do
    let(:donor_params) do
      {
        document_number: Faker::Number.number(digits: 10),
        email: Faker::Internet.email,
        first_name: 'first',
        last_name: 'last',
        phone_number: Faker::PhoneNumber.phone_number
      }
    end

    let(:amount) { Money.new(100.00) }

    let(:donation_params) { { amount: amount, user_agent: "user agent", ip: "ip" } }

    let(:payment_method_params) do
      {
        franchise: 'visa',
        holder: create(:donor),
        card_token: "token"
      }
    end

    it 'creates a new donation' do
      expect {
        CreateDonationService.new(
          donation_params: donation_params, donor_params: donor_params, payment_method_params: payment_method_params).create
      }.to change(Donation, :count).by(1)
    end

    it 'associates the donor and payment method with the donation' do
      donation = CreateDonationService.new(
        donation_params: donation_params, donor_params: donor_params, payment_method_params: payment_method_params)
                                      .create
      expect(donation).to be_a(Donation)
      expect(donation.amount).to eq(amount)
      expect(donation.donor).to be_a(Donor)
      expect(donation.donor.email).to eq(donor_params[:email])
      expect(donation.payment_method).to be_a(PaymentMethod)
      expect(donation.payment_method.franchise).to eq(payment_method_params[:franchise])
    end
  end
end
