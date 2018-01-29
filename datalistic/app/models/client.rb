class Client < ApplicationRecord
	has_many :order, dependent: :destroy, inverse_of: :client

	validates :first_name, :last_name, :email, :phone, presence: true
	validates :first_name, length: {minimum: 2, maximum: 50}
	validates :last_name, length: {minimum: 2, maximum: 50}
	validates :email, length: {minimum: 5, maximum: 100}
	validates :phone, length: {minimum: 5, maximum: 20}
end
