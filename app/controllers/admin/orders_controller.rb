class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
    @total_amount = OrderDetail.group(:order_id).select('order_id, sum(amount) AS sum_amount')
    @customers = Customer.all
    #binding.pry
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @shipping_cost = 800
    @total = 0
  end

end
