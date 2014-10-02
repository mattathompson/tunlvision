FactoryGirl.define do
  factory :deliverable do
    title       { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph rand 1..3 }
    timebox     { Faker::Business.credit_card_expiry_date }
    project     { create :project }
  end


end
