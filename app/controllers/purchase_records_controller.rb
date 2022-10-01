class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:create,:index]

  def index
    @order = Order.new
  end

  def new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address_postal_code,:ship_region_id,:shipping_address_city,:shipping_address_house_number,:shipping_address_building_name,:shipping_address_phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
