class TransactionService
  def initialize(donation, card_token)
    @payment_method = donation.payment_method
    @amount = donation.amount
    @card_token = card_token
  end

  def create
    transaction = Transaction.create! payment_method: @payment_method, amount: @amount

    payment_response = PaymentGateway::MercadoPagoDummyService.new(transaction).process_transaction

    if payment_response[:status] == "approved"
      transaction.paid!
      donation = transaction.payment_method.donation
      donation.payment_date = DateTime.now
      donation.collected!

      DonorMailer.donation_successful(donation.donor).deliver_now
    else
      transaction.rejected!
      transaction.payment_method.donation.rejected!
    end
  end

end