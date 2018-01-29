class Order < ApplicationRecord
  #PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  belongs_to :payment
  belongs_to :client
  has_many :order_line_items, dependent: :destroy, inverse_of: :order
  validates_associated :order_line_items

  validates :name, :email, :order_code, presence: true
  validates :name, length: {minimum: 2, maximum: 50}
  validates :address, length: {minimum: 5, maximum: 100}
  validates :order_code, length: {minimum: 5, maximum: 20}
  #validates :pay_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      order_item = OrderLineItem.new(quantity: item.quantity,
                                     price: item.price,
                                     discount: item.discount,
                                     product_id: item.product_id)
      order_line_items << order_item
    end
  end
end
