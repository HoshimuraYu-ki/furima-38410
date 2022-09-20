FactoryBot.define do

  factory :item do
    image                 {Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.png'))}
    item_name             {Faker::Name.initials(number: 5)}
    item_description      {Faker::Lorem.sentence}
    item_category_id      {Faker::Number.between(from:2,to:11)}
    item_condition_id     {Faker::Number.between(from:2,to:7)}
    item_shipping_fee_id  {Faker::Number.between(from:2,to:3)}
    ship_region_id        {Faker::Number.between(from:2,to:48)}
    item_shipped_date_id  {Faker::Number.between(from:2,to:4)}
    item_price            {Faker::Number.between(from:300,to:9999999)}
    association :user 
  end
end