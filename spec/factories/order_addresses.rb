FactoryBot.define do
  factory :order_address do
    Faker::Config.locale = :ja
    postal_code   { Faker::Address.zip_code }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { Gimei.city.kanji }
    house_number  { Gimei.town.to_s }
    building      { Faker::Address.building_number }
    phone_number  { Faker::PhoneNumber.cell_phone.gsub(/-/, '') }
    token         {"tok_abcdefghijk00000000000000000"}
    user_id       { nil }
    item_id       { nil } 
  end
end 