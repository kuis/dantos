FactoryGirl.define do
  factory :post do
    body "MyText"
    comments_count 1
    goomp nil
    user nil
    subtopic nil
  end
end
