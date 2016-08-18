FactoryGirl.define do
  factory :post do
    body { Faker::Lorem.paragraph }
    link_title { Faker::Lorem.sentence }
    link_image { Faker::Placeholdit.image }
    link_url { Faker::Internet.url }
    goomp
    user
  end
end
