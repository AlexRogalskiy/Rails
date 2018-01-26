class OrderLineItem < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, numericality: {greater_than_or_equal_to: 1}
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :discount, numericality: {greater_than_or_equal_to: 0.01, lower_than_or_equal_to: 1.00}

  # def total_price
  #   product.price * product.discount * quantity
  # end

  # def total_price_with_discount
  #   total_price * discount
  # end
end
