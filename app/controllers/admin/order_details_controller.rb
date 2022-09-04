class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.new
    @orders = Order.all
    @cart_items = current_customer.cart_items
    @order_detail.item_id = @cart_items.item.id
    @order_detail.amount = @cart_items.amount
    @order_detail.price = @cart_items.item.price
    @order_detail.order_id = @order.id
    binding.pry
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :amount, :making_status)
  end

end
