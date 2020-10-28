FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { "太郎" }
    first_name            { "山田" }
    last_name_kana        { "タロウ" }
    first_name_kana       { "ヤマダ" }
    birthday              { Faker::Date.birthday }
  end
end
