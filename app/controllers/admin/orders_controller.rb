class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
    #binding.pry
  end

  def show
  end

end
