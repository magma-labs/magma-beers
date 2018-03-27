# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    name FFaker::Name.unique.name
    email FFaker::Internet.email
    body FFaker::Lorem.sentence
  end
end
