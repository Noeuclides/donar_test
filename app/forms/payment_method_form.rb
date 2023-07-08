class PaymentMethodForm < ApplicationForm
  include ActiveModel::Model

  attr_accessor :card_token, :document_type, :document_number

  validates :card_token, :document_type, :document_number, presence: true
end
