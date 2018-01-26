class Order < ApplicationRecord
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]
  has_many :order_line_items, dependent: :destroy, inverse_of: :order

  validates :name, :address, :email, presence: true
  validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      order_line_items << item
    end
  end
end
