# README

## users table
| Column               | Type   | Options                   |
| -------------------- | ------ | ------------------------- |
| user_nickname        | string | null: false               |
| email                | string | null: false, unique: true |
| encrypted_password   | string | null: false               |
| user_first_name      | string | null: false               |
| user_last_name       | string | null: false               |
| user_first_name_kana | string | null: false               |
| user_last_name_kana  | string | null: false               |
| user_date_of_birth   | date   | null: false               |

### Association
  has_many :items
  has_many :purchase_records

## items table
| Column               | Type       | Options                       |
| -------------------- | ---------- | ----------------------------- |
| user                 | references | null: false, foreign_key:true |
| item_name            | string     | null: false                   |
| item_description     | text       | null: false                   |
| item_category_id     | integer    | null: false                   |
| item_condition_id    | integer    | null: false                   |
| item_shipping_fee_id | integer    | null: false                   |
| ship_region_id       | integer    | null: false                   |
| item_shipped_date_id | integer    | null: false                   |
| item_price           | integer    | null: false                   |

<!-- item_img ※ActiveStorage null: false -->

### Association
  belongs_to :user
  has_one    :purchase_record

## purchase_records
| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false, foreign_key:true |
| item   | references | null: false, foreign_key:true |

### Association
  belongs_to :user
  belongs_to :item
  has_one :shipping_address

## shipping_address
| Column                         | Type       | Options                       |
| ------------------------------ | ---------- | ----------------------------- |
| purchase_record                | references | null: false, foreign_key:true |
| shipping_address_postal_code   | string     | null: false                   |
| ship_region_id                 | integer    | null: false                   |
| shipping_address_city          | string     | null: false                   |
| shipping_address_house_number  | string     | null: false                   |
| shipping_address_building_name | string     |                               |
| shipping_address_phone_number  | string     | null: false                   |

### Association
  belongs_to :purchase_record