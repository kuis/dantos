FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password "qwer1234"
    password_confirmation "qwer1234"
    picture "qwer1234"
  end
end
