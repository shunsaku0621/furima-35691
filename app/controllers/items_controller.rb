class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :not_edit_delite, only: [:edit, :update, :destroy]
  before_action :sold_not_edit, only: [:edit, :create, :destroy]


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
      redirect_to item_path
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
    params.require(:item).permit(:title, :text, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def not_edit_delite
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def sold_not_edit
    unless @item.order.blank?
      redirect_to root_path
    end
  end
end
