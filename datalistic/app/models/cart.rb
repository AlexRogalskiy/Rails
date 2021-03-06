class Cart < ApplicationRecord
	has_many :line_items, dependent: :destroy, inverse_of: :cart
	#has_one :order, dependent: :destroy, inverse_of: :cart
	#validates_associated :line_items

	def add_product(product_id)
	    current_item = line_items.find_by(product_id: product_id)
	    if current_item
	      current_item.quantity += 1
	    else
	      current_item = line_items.build(product_id: product_id)
	      current_item.price = current_item.product.total_price
	    end
	    current_item
	end

	def total_price
      line_items.to_a.sum { |item| item.total_price }
	end

	def total_price_with_discount
      line_items.to_a.sum { |item| item.total_price_with_discount }
	end
end
