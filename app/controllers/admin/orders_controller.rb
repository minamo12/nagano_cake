class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.page(params[:page]).per(10)
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

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end
