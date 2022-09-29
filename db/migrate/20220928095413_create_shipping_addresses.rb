class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string  :shipping_address_postal_code
      t.integer :ship_region_id
      t.string  :shipping_address_city
      t.string  :shipping_address_house_number
      t.string  :shipping_address_building_name
      t.string  :shipping_address_phone_number

      t.references :purchase_record, foreign_key: true
      t.timestamps
    end
  end
end
