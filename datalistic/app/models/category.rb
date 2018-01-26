class Category < ApplicationRecord
	has_many :products

	validates :title, :description, :order, presence: true
	validates :title, uniqueness: true
	validates :title, length: {minimum: 5}
	validates :order, numericality: {greater_than_or_equal_to: 0}
end
