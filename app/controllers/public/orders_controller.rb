class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def index
    @orders = Order.all
  end

  def show
  end

  def confirm
    @cart_items = CartItem.all
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @total = 0
    @cart_items = current_customer.cart_items
    @order.total_payment = 0
    #0 自分の住所
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name

    #1 登録住所からの選択
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.first_name + current_customer.last_name
    else #2 新しい登録先
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    if @order.save #注文機能への格納が成功したら詳細への格納を開始
    else
    end
    redirect_to orders_complete_path
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment)
  end

end
