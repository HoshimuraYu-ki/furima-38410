FactoryBot.define do
  factory :order do
    user_id                        { Faker::Number.non_zero_digit }
    item_id                        { Faker::Number.non_zero_digit }
    shipping_address_postal_code   { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    ship_region_id                 { Faker::Number.between(from: 2, to: 48) }
    shipping_address_city          { Faker::Address.city }
    shipping_address_house_number  { Faker::Address.street_address }
    shipping_address_building_name { Faker::Address.street_address }
    shipping_address_phone_number  { Faker::Number.decimal_part(digits: 11) }
    token                          { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end