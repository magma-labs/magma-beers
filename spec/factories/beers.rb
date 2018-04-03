FactoryBot.define do
  factory :beer do
    name FFaker::Name.unique.name
    description FFaker::BaconIpsum.paragraph
    status FFaker::Boolean.random
    photo_remote_url nil
  end
end
