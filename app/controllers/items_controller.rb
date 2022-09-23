class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:edit,:destroy]
  before_action :item_set, only: [:show,:edit,:update,:destroy]
  before_action :editor_check, only: [:edit,:destroy]

  def index
    @items = Item.all.order("created_at DESC")
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else 
      render :new
    end
  end
  def show
  end
  def edit
  end
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  def destroy
    @item.destroy
    redirect_to root_path
  end
private

  def item_params
    params.require(:item).permit(:item_name, :item_description,:item_category_id, :item_condition_id, :item_shipping_fee_id, :item_shipped_date_id, :ship_region_id,:item_price, :image).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end

  def editor_check
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end
end