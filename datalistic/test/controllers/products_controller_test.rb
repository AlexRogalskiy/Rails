require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
#class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      title:       'Lorem Ipsum123456',
      description: 'Wibbles are fun!',
      image_url:   'lorem.jpg',
      price:       19.95
    }
  end

  test "should get index" do
    get products_url
    assert_response :success
    assert_not_nil products_url(@products)
    #assert_not_nil assigns(:products)
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      #post products_url, params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title } }
      post products_url, params: { product: { description: @update[:description], image_url: @update[:image_url], price: @update[:price], title: @update[:title] } }
    end
    assert_redirected_to product_url(Product.last)
    #assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    #get :show, id: @product
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    #put :update, id: @product, product: @update
    #patch product_url(@product), params: { product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title } }
    patch product_url(@product), params: { product: { description: @update[:description], image_url: @update[:image_url], price: @update[:price], title: @update[:title] } }
    #assert_response :success
    assert_redirected_to product_url(@product)
    #assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      #delete :destroy, id: @product
      delete product_url(@product)
    end
    assert_redirected_to products_url
    #assert_redirected_to products_path
  end
end
