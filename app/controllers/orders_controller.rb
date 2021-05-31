class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = Item.find(params[:item_id])
    @order_destination = OrderDestination.new
  end
  

  def create
    # binding.pry
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      return redirect_to root_path
    else 
      render action: :index
    end
      
  end


  private


  def order_params
    params.require(:order_destination).permit(:post_num, :prefecture_id, :city, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount:  Item.find(order_params[:item_id]).price,
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
