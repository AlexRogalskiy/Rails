#require File.expand_path('../../config/environments/test.rb', __FILE__)

class TestModel < ActiveRecord::Base
  self.abstract_class = false
  has_many :line_items

  attr_accessor :name

  def self.find_all_unpaid
  		self.where('paid = 0')
  end

  def total
  	sum = 0
  	line_items.each {|li| sum += li.total}
  	sum
  end

  def self.of
    self.new
  end
end
