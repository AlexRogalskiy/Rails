require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:one)
    @update = {
      title:       'Ipsum123456',
      description: 'Wibbles are fun!',
      order:   1,
      category_id: nil
    }
  end

  test "should get index" do
    get categories_url
    assert_response :success
  end

  test "should get new" do
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    assert_difference('Category.count') do
      post categories_url, params: { category: {title: @update[:title], description: @update[:description], order: @update[:order], category_id: @update[:category_id]} }
    end
    assert_redirected_to category_url(Category.last)
  end

  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_url(@category)
    assert_response :success
  end

  test "should update category" do
    patch category_url(@category), params: { category: {title: "title", description: "description", order: 1, category_id: nil} }
    assert_redirected_to category_url(@category)
  end

  test "should destroy category" do
    assert_difference('Category.count', -1) do
      delete category_url(@category)
    end
    assert_redirected_to categories_url
  end
end
