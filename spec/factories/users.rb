FactoryBot.define do
  
  factory :user do
    user_nickname         {Faker::Name.initials(number: 4)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    user_last_name        {'山田'}
    user_first_name       {'陸太郎'}
    user_last_name_kana   {'ヤマダ'}
    user_first_name_kana  {'リクタロウ'}
    user_date_of_birth    {'1990-01-01'}
  end
end