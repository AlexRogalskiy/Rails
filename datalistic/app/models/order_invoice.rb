class OrderInvoice < ApplicationRecord
	belongs_to :order
	has_one :order, dependent: :destroy, inverse_of: :order_invoice
end
