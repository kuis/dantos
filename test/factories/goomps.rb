FactoryGirl.define do
  factory :goomp do
    name { Faker::Commerce.product_name }
    cover { Faker::Placeholdit.image }
    description { Faker::Lorem.paragraph }
    user
  end
end
