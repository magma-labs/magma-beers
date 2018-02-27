FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Cool Player#{n}" }
    sequence(:email) { |n| "user#{n}@email.com" }
    password "12345678"
  end
end
