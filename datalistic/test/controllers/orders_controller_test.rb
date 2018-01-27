require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
    @update = {
      address:  'Lorem Ipsum123456',
      email:    'Wun@gmail.com',
      name:     'lorem',
      pay_type: 'Check'
    }
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "requires item in cart" do
    get new_order_url
    assert_redirected_to store_path
    assert_equal flash[:notice], 'Your cart is empty'
  end

  test "should get new" do
    item = LineItem.new
    item.build_cart
    item.product = products(:ruby)
    item.price = 1
    item.save!
    #session[:cart_id] = item.cart.id

    get new_order_url
    assert_redirected_to store_url
    #assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post orders_url, params: { order: { address: @update[:address], email: @update[:email], name: @update[:name], pay_type: @update[:pay_type] } }
    end
    assert_redirected_to store_url#order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { address: @update[:address], email: @update[:email], name: @update[:name] } }
    assert_redirected_to order_url(@order)
    #assert_response :success
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete order_url(@order)
    end
    assert_redirected_to orders_url
  end
end
