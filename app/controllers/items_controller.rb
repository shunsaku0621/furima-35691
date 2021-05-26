class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    #メッセージ投稿機能カリキュラム
  end



  private
  def item_params
    params.require(:item).permit(:title, :text, :category_id, :status_id, :shipping_fee_id, :prefecture_id, :delivery_id, :price, :image).merge(user_id: current_user.id)
  end
end
