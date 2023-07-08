require 'rails_helper'

RSpec.describe CreateDonorService do
  let(:params) do
    {
      email: Faker::Internet.email,
      document_number: Faker::Number.number(digits: 10),
      phone_number: Faker::PhoneNumber.phone_number,
      first_name: 'first',
      last_name: 'last',
      birthdate: DateTime.new(1990, 1, 1)
    }
  end

  describe '#create' do
    context 'when a donor with the same document number already exists' do
      let!(:existing_donor) { create(:donor) }

      it 'updates the existing donor' do
        new_email = Faker::Internet.email
        params = { document_number: existing_donor.document_number, email: new_email }
        service = described_class.new(params)

        expect { service.create }.to change { existing_donor.reload.email }.to(new_email)
      end
    end

    context 'when a donor with the same document number does not exist' do
      it 'creates a new donor' do
        service = described_class.new(params)

        expect { service.create }.to change(Donor, :count).by(1)
      end
    end

    context 'when the params are invalid' do
      it 'raises an error' do
        params = { document_number: '123456789' }
        service = described_class.new(params)

        expect { service.create }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
