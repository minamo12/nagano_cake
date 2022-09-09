class Order < ApplicationRecord

  has_many :order_details, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { payment_waiting: 0, payment_confirmation: 1, making: 2, shipping_preparation: 3, shipping_completed: 4}

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    cart_item.with_tax_price * amount
  end

  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end
