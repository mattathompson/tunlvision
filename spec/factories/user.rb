FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    name { Faker::Name.name } 
    password "awfulPass"
    password_confirmation "awfulPass"
  end

  trait :admin do
    admin true
  end
end
