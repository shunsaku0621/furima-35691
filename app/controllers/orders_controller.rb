class OrdersController < ApplicationController
  def index
    @order = Item.find(params[:item_id])
  end


  # def new
  #   # @order = Item.find(params[:item_id])
  # end

  

  def create
    binding.pry
    @order = Order.create(order_params)
    pay_item
    Destination.create(destination_params)
  end


  private

  def order_params
    params.merge(user_id: current_user.id, item_id: params[:user_id], token: params[:token])
  end

  def destination_params
    params.permit(:post_num, :prefecture_id, :city, :address, :building, :phone_num).merge(order_id: @order.id)
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
