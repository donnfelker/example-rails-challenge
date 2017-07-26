FactoryGirl.define do
  factory :credit_card_charge do
    amount { Faker::Number.number(8) }
    currency :usd
    paid false
    refunded false
    customer
  end
end
