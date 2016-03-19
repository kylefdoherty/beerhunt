FactoryGirl.define do
  factory :beer do
    name Faker::Beer.name
    description Faker::Lorem.paragraph
    brewery Faker::Company.name
    abv Faker::Beer.alcohol
  end
end
