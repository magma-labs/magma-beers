FactoryBot.define do
  factory :user do
    email FFaker::Internet.email
    password FFaker::InternetSE.password
    after(:build) do |user|
      user.add_role :user
      user.confirmed_at = Time.zone.now
    end
  end

  factory :admin, class: User do
    email FFaker::Internet.email
    password FFaker::InternetSE.password
    after(:create) do |user|
      user.add_role :admin
    end

    after(:build) do |user|
      user.confirmed_at = Time.zone.now
    end

  end
end
