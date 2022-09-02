class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
  end

  def show
  end

  def confirm
    #0 自分の住所
    if params[:order][:select_address] == "0"
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
    #1 登録住所からの選択

    elsif params[:order][:select_address] == "1"
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name

    else #2 新しい登録先
      @order = Order.new(order_params)
    end
    binding.pry
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
