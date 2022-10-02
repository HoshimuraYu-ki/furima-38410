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
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:shipping_address_postal_code,:ship_region_id,:shipping_address_city,:shipping_address_house_number,:shipping_address_building_name,:shipping_address_phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.item_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
