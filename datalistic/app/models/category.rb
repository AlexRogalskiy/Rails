class Category < ApplicationRecord
	#belongs_to :category
	has_many :products, inverse_of: :category
	has_many :categories, inverse_of: :category
	validates_associated :products

	validates :title, :description, :order, presence: true
	
	validates_uniqueness_of :title, :scope => [:category_id]

	validates :title, length: {minimum: 5, maximum: 100}
	validates :order, numericality: {greater_than_or_equal_to: 0}
end
