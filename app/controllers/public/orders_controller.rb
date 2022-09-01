class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orderd_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name,
    :shipping_cost, :total_payment, :payment_method, :status)
  end

end
