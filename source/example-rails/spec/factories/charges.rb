FactoryBot.define do
  factory :charge do
    created { DateTime.now.to_i }
    paid { true }
    amount { rand(3000..4000) }
    currency { "usd" }
    refunded { false }
    customer { FactoryBot.create(:customer) }
  end
end
