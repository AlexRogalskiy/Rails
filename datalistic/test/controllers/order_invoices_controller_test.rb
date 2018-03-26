require 'test_helper'

class OrderInvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order_invoice = order_invoices(:one)
  end

  test "should get index" do
    get order_invoices_url
    assert_response :success
  end

  test "should get new" do
    get new_order_invoice_url
    assert_response :success
  end

  test "should create order_invoice" do
    assert_difference('OrderInvoice.count') do
      post order_invoices_url, params: { order_invoice: {  } }
    end

    assert_redirected_to order_invoice_url(OrderInvoice.last)
  end

  test "should show order_invoice" do
    get order_invoice_url(@order_invoice)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_invoice_url(@order_invoice)
    assert_response :success
  end

  test "should update order_invoice" do
    patch order_invoice_url(@order_invoice), params: { order_invoice: {  } }
    assert_redirected_to order_invoice_url(@order_invoice)
  end

  test "should destroy order_invoice" do
    assert_difference('OrderInvoice.count', -1) do
      delete order_invoice_url(@order_invoice)
    end

    assert_redirected_to order_invoices_url
  end
end
