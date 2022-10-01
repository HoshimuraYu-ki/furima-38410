class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string  :shipping_address_postal_code   ,null: false
      t.integer :ship_region_id                 ,null: false
      t.string  :shipping_address_city          ,null: false
      t.string  :shipping_address_house_number  ,null: false
      t.string  :shipping_address_building_name
      t.string  :shipping_address_phone_number  ,null: false

      t.references :purchase_record, foreign_key: true
      t.timestamps
    end
  end
end
