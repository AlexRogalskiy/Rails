require 'test_helper'

class CartTest < ActiveSupport::TestCase
  def setup
    @cart  = Cart.create
    @order = Order.create
    @book_one = products(:one)
    @book_two  = products(:two)
    @book_one_order = orders(:one)
  end

  test "add unique products" do
    line_item = @cart.add_product(@book_one.id)
    line_item.order = @book_one_order
    line_item.save!

    line_item = @cart.add_product(@book_two.id)
    line_item.order = @book_one_order
    line_item.save!

    assert_equal 2, @cart.line_items.size
    assert_equal @book_one.price + @book_two.price, @cart.total_price
  end
  
  test "add_duplicate_product" do
    line_item = @cart.add_product(@book_one.id)
    line_item.order = @book_one_order
    line_item.save!

    line_item = @cart.add_product(@book_one.id)
    line_item.order = @book_one_order
    line_item.save!

    assert_equal 2 * @book_one.price, @cart.total_price
    assert_equal 1, @cart.line_items.size
    assert_equal 2, @cart.line_items[0].quantity
  end
end
