# FURIMA

## 概要
フリーマーケットのアプリケーションを作成しました。
ユーザーを登録することで商品を出品できるようになります。
自身が出品した商品の編集と削除をすることができます。（売却済みの商品を除く）
他者が出品した商品は、クレジットカードを用いて購入することができます。（売却済みの商品を除く）

## 使用言語
HTML,CSS
Ruby 2.6.5
JavaScript

## テスト
RSpec
単体テスト(model)

## URL
https://furima38410.onrender.com

## 挙動確認
Basic認証
ID： admin
Pass： 2222

## テーブル設計
### users table
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

 Association
  has_many :items
  has_many :purchase_records

### items table
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

 Association
  belongs_to :user
  has_one    :purchase_record

### purchase_records
| Column | Type       | Options                       |
| ------ | ---------- | ----------------------------- |
| user   | references | null: false, foreign_key:true |
| item   | references | null: false, foreign_key:true |

 Association
  belongs_to :user
  belongs_to :item
  has_one :shipping_address

### shipping_address
| Column                         | Type       | Options                       |
| ------------------------------ | ---------- | ----------------------------- |
| purchase_record                | references | null: false, foreign_key:true |
| shipping_address_postal_code   | string     | null: false                   |
| ship_region_id                 | integer    | null: false                   |
| shipping_address_city          | string     | null: false                   |
| shipping_address_house_number  | string     | null: false                   |
| shipping_address_building_name | string     |                               |
| shipping_address_phone_number  | string     | null: false                   |

 Association
  belongs_to :purchase_record