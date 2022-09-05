class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @cart_items = CartItem.all
    @total_amount = 0
  end

  def show
  end

end
