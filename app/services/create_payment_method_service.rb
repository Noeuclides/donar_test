class CreatePaymentMethodService
  def initialize(params)
    @params = params
  end

  def create
    PaymentMethod.create! @params
  end
end