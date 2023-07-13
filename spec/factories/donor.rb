FactoryBot.define do
  factory :donor do
    email { Faker::Internet.email }
    document_number { Faker::Number.number(digits: 10) }
    phone_number { Faker::Base.numerify('3#########') }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
