class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
    #binding.pry
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

end
