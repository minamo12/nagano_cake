class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    @cart_item = CartItem.all
  end

  def show
  end

end
