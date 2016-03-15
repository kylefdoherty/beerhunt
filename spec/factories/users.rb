FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    provider Faker::Company.name
    uid Faker::Code.ean
    location Faker::Address.city
    image_url Faker::Avatar.image
  end
end
