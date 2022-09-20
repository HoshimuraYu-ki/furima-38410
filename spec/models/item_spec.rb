require 'rails_helper'

RSpec.describe Item, type: :model do

  before do 
    @item = FactoryBot.build(:item)
  end

  describe "商品情報入力" do
    context "商品情報の入力が正しい時" do
      it "全ての値が正しく入力されていれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context "商品情報の入力が正しくない時" do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "item_nameが空だと出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "item_descriptionが空だと出品できない" do
        @item.item_description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it "item_category_idが未選択（1）だと出品できない" do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item category can't be blank")
      end
      it "item_condition_idが未選択だと出品できない" do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition can't be blank")
      end
      it "item_shipping_idが未選択だと出品できない" do
        @item.item_shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipping fee can't be blank")
      end
      it "ship_region_idが未選択だと出品できない" do
        @item.ship_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Ship region can't be blank")
      end
      it "item_shipped_date_idが未選択だと出品できない" do
        @item.item_shipped_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item shipped date can't be blank")
      end
      it "item_priceが空だと出品できない" do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it "item_priceが全角数字だと出品できない" do
        @item.item_price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end
      it "item_priceが少数だとと出品できない" do
        @item.item_price = "1.1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be an integer")
      end
      it "item_priceが300円未満では出品できない" do
        @item.item_price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")
      end
      it "item_priceが9999999円を超えると出品できない" do
        @item.item_price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
      it "userが紐付いていなければ出品できない" do
        @item.user_id = nil
        @item.valid?
        expect(FactoryBot.build(:item).user_id)
      end
    end
  end
end