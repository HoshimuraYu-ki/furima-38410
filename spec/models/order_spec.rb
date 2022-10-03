require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order,item_id: @item.id,user_id: @user.id)
    sleep 0.1 #インスタンス作成に待機時間を確保#
  end

  describe "商品の購入機能" do
    context "商品購入の入力が正しい時" do
      it "全ての値が正しく入力されていれば購入できる" do
        expect(@order).to be_valid
      end
      it "建物名が空でも購入できる" do
        @order.shipping_address_building_name = nil
        expect(@order).to be_valid
      end
    end

    context "商品購入の入力が正しくない時" do
      it "郵便番号が空だと購入できない" do
        @order.shipping_address_postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping address postal code can't be blank")
      end
      it "郵便番号は3桁ハイフン4桁でないと購入できない" do
        @order.shipping_address_postal_code = "1234567"
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping address postal code is invalid")
      end
      it "郵便番号は全角文字列だと購入できない" do
        @order.shipping_address_postal_code = "１２３-４５６７"
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping address postal code is invalid")
      end
      it "都道府県が未選択だと購入できない" do
        @order.ship_region_id = "1"
        @order.valid?
        expect(@order.errors.full_messages).to include("Ship region can't be blank")
      end
      it "市区町村が空だと購入できない" do
        @order.shipping_address_city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping address city can't be blank")
      end
      it "番地が空だと購入できない" do
        @order.shipping_address_house_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping address house number can't be blank")
      end
      it "電話番号が空だと購入できない" do
        @order.shipping_address_phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping address phone number can't be blank")
      end
      it "電話番号が10桁未満だと購入できない" do
        @order.shipping_address_phone_number = "090123456"
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping address phone number is invalid")
      end
      it "電話番号が12桁以上だと購入できない" do
        @order.shipping_address_phone_number = "090123456789"
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping address phone number is invalid")
      end
      it "電話番号が全角文字列だと購入できない" do
        @order.shipping_address_phone_number = "０９０１２３４５６７８"
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping address phone number is invalid")
      end
      it "電話番号にハイフンが入ると購入できない" do
        @order.shipping_address_phone_number = "090-1234-56"
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping address phone number is invalid")
      end
      it "クレジット情報のtokunが生成されていないと購入できない" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "User情報と紐付いていないと購入できない" do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it "Item情報と紐付いていないと購入できない" do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end