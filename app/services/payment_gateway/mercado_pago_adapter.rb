class PaymentGateway::MercadoPagoAdapter

  def initialize(transaction)
    @transaction = transaction
  end

  def self.process_transaction(donation)
    raise NotImplementedError, 'Subclasses must implement this method'
  end
end