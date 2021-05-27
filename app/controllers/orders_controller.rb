class OrdersController < ApplicationController
  def index
    @order = Item.find(params[:item_id])
  end

  def new
  end

  def create
  end
end
