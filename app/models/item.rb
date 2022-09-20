class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :item_shipping_fee
  belongs_to :ship_region
  belongs_to :item_shipped_date

  belongs_to :user

  validates :item_name, :item_description, :item_price, :image, presence: true
  validates :item_category_id, :item_condition_id, :item_shipping_fee_id, :item_shipped_date_id, :ship_region_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_price, numericality: { only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end