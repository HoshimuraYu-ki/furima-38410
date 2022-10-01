class Order
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,
                :shipping_address_postal_code,
                :ship_region_id,
                :shipping_address_city,
                :shipping_address_house_number,
                :shipping_address_building_name,
                :shipping_address_phone_number

  with_options presence: true do
    validates :shipping_address_postal_code
    validates :ship_region_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :shipping_address_city
    validates :shipping_address_house_number, format: { with: /\A\d{3}[-]\d{4}\z/} 
    validates :shipping_address_phone_number, length: { maximum: 11 }
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id,item_id: item_id)
    ShippingAddress.create(purchase_record_id: purchase_record.id,shipping_address_postal_code: shipping_address_postal_code,ship_region_id: ship_region_id,shipping_address_city: shipping_address_city,shipping_address_house_number: shipping_address_house_number,shipping_address_building_name: shipping_address_building_name,shipping_address_phone_number: shipping_address_phone_number)
  end
end