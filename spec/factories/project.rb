FactoryGirl.define do
  factory :project do
    title       { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph rand 1..3 }
    deadline    { Faker::Business.credit_card_expiry_date }
    client      { Faker::Company.name }
    user        { create :user }
  end
end
