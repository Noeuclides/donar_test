class TransactionService
  def initialize(donation, card_token)
    @payment_method = donation.payment_method
    @amount = donation.amount
    @card_token = card_token
  end

  def create
    payment_method = PaymentMethodInscription.create! payment_method_params: @payment_method, card_token: @card_token
  end
end