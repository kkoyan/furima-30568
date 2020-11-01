FactoryBot.define do
  factory :item do
    image { 'test_image.png' }
    name { Faker::String.random }
    explanation { Faker::String.random }
    category_id { rand(2..11) }
    condition_id { rand(2..7) }
    shipping_charge_id { rand(2..3) }
    shipping_area_id { rand(2..48) }
    shipping_days_id { rand(2..4) }
    price { rand(300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end