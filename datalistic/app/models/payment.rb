class Payment < ApplicationRecord
	PAYMENT_TYPE = [ "Check", "Credit card", "Purchase order" ]
	PAYMENT_STATUS = [ "Paid", "Unpaid", "Pending", "Free" ]

	has_many :order_invoices, dependent: :destroy, inverse_of: :payment
	validates_associated :order_invoices

	validates :pay_type, :pay_status, :pay_code, presence: true
	validates :pay_type, inclusion: PAYMENT_TYPE
	validates :pay_status, inclusion: PAYMENT_STATUS
	validates :pay_code, length: {minimum: 5, maximum: 20}
end
