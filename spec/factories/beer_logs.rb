FactoryBot.define do
  factory :beer_log do
    user nil
    beer nil
    quantity FFaker::AddressUA.building_number
  end
end
