# frozen_string_literal: true

FactoryBot.define do
  factory :charge do
    amount { 10 }

    trait :successful do
      paid { true }
    end

    trait :failed do
      failed_at { Time.now }
    end

    trait :disputed do
      disputed_at { Time.now }
    end
  end
end
