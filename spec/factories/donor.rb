FactoryBot.define do
  factory :donor do
    email { Faker::Internet.email }
    document_number { Faker::Number.number(digits: 10) }
    phone_number { Faker::PhoneNumber.phone_number }
    first_name { "first" }
    last_name { "last" }
  end
end
