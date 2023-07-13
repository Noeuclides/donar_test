class CreateDonationService
  def initialize(donation_params:, donor_params:, payment_method_params:)
    @donor_params = donor_params
    @donation_params = donation_params
    @payment_method_params = payment_method_params
  end

  def create
    donor = CreateDonorService.new(@donor_params).create

    payment_method = CreatePaymentMethodService.new(@payment_method_params.merge({ holder: donor })).create
    donation = Donation.new(@donation_params)
    donation.donor = donor
    donation.payment_method = payment_method

    donation.save!
    donation
  end
end