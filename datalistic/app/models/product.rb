class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, inverse_of: :product
  has_many :order_line_items, inverse_of: :product
  #has_many :orders, through: :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, :price, :category, presence: true
  
  validates :vote, numericality: {greater_than_or_equal_to: 0}

  validates :limit, numericality: {greater_than_or_equal_to: 0}

  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :discount, numericality: {greater_than_or_equal_to: 0.01, lower_than_or_equal_to: 1.00}

  validates :title, uniqueness: { case_sensitive: false }
  validates :title, length: {minimum: 5, maximum: 100}

  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)\Z}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }

  	def self.latest
    	Product.order(:updated_at).last
  	end

    def total_price
      price * discount
    end

    private

    def ensure_not_referenced_by_any_line_item
      unless order_line_items.empty?
        errors.add(:base, 'Order Line Items present')
        return false
      end
    end
end
