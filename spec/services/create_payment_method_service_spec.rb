require 'rails_helper'

RSpec.describe CreatePaymentMethodService do
  describe '#create' do
    let(:donor) { create(:donor) }

    context 'when the params are valid' do
      let(:valid_params) do
        {
          holder: donor,
          franchise: 'visa',
          card_token: 'token'
        }
      end

      it 'creates a new payment method' do
        service = described_class.new(valid_params)

        expect { service.create }.to change(PaymentMethod, :count).by(1)
      end
    end

    context 'when the params are invalid' do
      let(:invalid_params) do
        {
          holder_id: donor.id,
          franchise: nil
        }
      end

      it 'raises an ActiveRecord::RecordInvalid error' do
        service = described_class.new(invalid_params)

        expect { service.create }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
