class Order < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  belongs_to :customer

  enum payment_method: { credit_card: 0, transfer: 1 }

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
