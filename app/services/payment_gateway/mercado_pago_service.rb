class PaymentGateway::MercadoPagoService < PaymentGateway::MercadoPagoAdapter
  def process_transaction(donation)
    mp = MercadoPago.new(ENV['MERCADO_PAGO_ACCESS_TOKEN'])
    payment_data = build_payment_data(donation)

    response = mp.create_payment(payment_data)

    if response['status'] == 'approved'
      update_donation_status(donation, 'approved')
    else
      update_donation_status(donation, 'rejected')
    end
  rescue MercadoPagoException => e
    update_donation_status(donation, 'error')
    Rails.logger.error("Mercado Pago API Error: #{e.message}")
  end

  def build_payment_data(donation)
    {
      transaction_amount: donation.amount,
      token: donation.payment_method.token,
      description: 'Donation',
      installments: 1,
      payment_method_id: donation.payment_method.payment_method_id,
      payer: {
        email: donation.donor.email
      }
    }
  end

  def update_donation_status(donation, status)
    donation.update(transaction_status: status)
  end

end