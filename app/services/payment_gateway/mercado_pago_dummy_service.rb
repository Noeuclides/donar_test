class PaymentGateway::MercadoPagoDummyService < PaymentGateway::MercadoPagoAdapter

  TRANSACTION_STATUSES = %w[approved rejected]
  def process_transaction
    { status: TRANSACTION_STATUSES.sample }
  end

end