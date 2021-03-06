require 'test_helper'

class OrderLineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_line_item = order_line_items(:one)
    @update = {
      quantity:  2,
      price:    2.00,
      discount:     1.0,
      order_id: orders(:one).id,
      product_id: products(:one).id
    }
  end

  test "should get index" do
    get order_line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_order_line_item_url
    assert_response :success
  end

  test "should create order_line_item" do
    assert_difference('OrderLineItem.count') do
      post order_line_items_url, params: { order_line_item: { quantity: @update[:quantity], price: @update[:price], discount: @update[:discount], order_id: @update[:order_id], product_id: @update[:product_id]} }
    end
    assert_redirected_to order_line_item_url(OrderLineItem.last)
  end

  test "should show order_line_item" do
    get order_line_item_url(@order_line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_line_item_url(@order_line_item)
    assert_response :success
  end

  test "should update order_line_item" do
    patch order_line_item_url(@order_line_item), params: { order_line_item: { product_id: products(:one).id } }
    #assert_response :success
    assert_redirected_to order_line_item_url(@order_line_item)
  end

  test "should destroy order_line_item" do
    assert_difference('OrderLineItem.count', -1) do
      delete order_line_item_url(@order_line_item)
    end
    assert_redirected_to order_line_items_url
  end
end
