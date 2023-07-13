require 'factory_bot'

Admin.create! email: "admin1@mail.com", password: "123456"

5.times do
  donor1 = FactoryBot.create(:donor)
  FactoryBot.create(:payment_method, holder: donor1)
end

campaign1 = Campaign.create! name: "first campaign"

PaymentMethod.all.each do |pm|
  amount = Faker::Number.decimal(l_digits: 2, r_digits: 2).to_f
  money = Money.new(amount, 'USD')
  FactoryBot.create(:donation,
                    amount: money,
                    campaign: campaign1,
                    donor: pm.holder,
                    payment_method: pm)
end
