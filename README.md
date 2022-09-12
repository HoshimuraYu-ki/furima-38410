# README

## users table
| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| user_nickname        | string | null: false,              |
| user_email           | text   | null: false, unique: true |
| user_password        | text   | null: false               |
| user_encrypted       | text   | null: false               |
| user_first_name      | string | null: false               |
| user_last_name       | string | null: false               |
| user_first_name_kana | string | null: false               |
| user_last_name_kana  | string | null: false               |
| user_date_of_birth   | date   | null: false               |

### Association
  has_many :items
  has_many :purchase_records

## items table
| Column            | Type           | Options                       |
| ----------------- | -------------- | ----------------------------- |
| user_id           | references     | null: false, foreign_key:true |
| item_img          | ※ActiveStorage | null: false                   |
| item_name         | string         | null: false                   |
| item_description  | text           | null: false                   |
| item_category     | text           | null: false                   |
| item_condition    | string         | null: false                   |
| item_shipping_fee | string         | null: false                   |
| item_ship_region  | string         | null: false                   |
| item_shipped_date | string         | null: false                   |
| item_price        | integer        | null: false                   |

### Association
  belongs_to :user
  has_one    :purchase_record

## purchase_records
| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user_id | references | null: false, foreign_key:true |
| item_id | references | null: false, foreign_key:true |

### Association
  belongs_to :user
  belongs_to :item
  has_one :shipping_address

## shipping_address
| Column                         | Type       | Options                       |
| ------------------------------ | ---------- | ----------------------------- |
| purchase_record_id             | references | null: false, foreign_key:true |
| shipping_address_postal_code   | string     | null: false                   |
| shipping_address_region        | string     | null: false                   |
| shipping_address_city          | text       | null: false                   |
| shipping_address_house_number  | text       | null: false                   |
| shipping_address_building_name | text       |                               |
| shipping_address_phone_number  | string     | null: false                   |

### Association
  belongs_to :purchase_record