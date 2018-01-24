require 'test_helper'

class TestControllerTest < ActionDispatch::IntegrationTest
  test "should get connect" do
    get test_connect_url
    assert_response :success
  end

  test "should get disconnect" do
    get test_disconnect_url
    assert_response :success
  end

end
