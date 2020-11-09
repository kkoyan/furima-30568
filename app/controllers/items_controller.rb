class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]


  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def edit
    redirect_to root_path if current_user.id != @item.user.id
  end

  def update
    if @item.update(item_params)
       redirect_to root_path 
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    if@item.destroy
      redirect_to root_path 
    else
      render :show
    end
  end

  private

  def move_to_index
    redirect_to root_path unless user_signed_in? && current_user.id == @item.user.id && @item.order.nil?
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:price, :name, :explanation, :category_id, :condition_id, :shipping_charge_id, :shipping_area_id, :shipping_days_id, :image).merge(user_id: current_user.id)
  end
end
