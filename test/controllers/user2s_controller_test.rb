require "test_helper"

class User2sControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user2s_new_url
    assert_response :success
  end

  test "should get create" do
    get user2s_create_url
    assert_response :success
  end

  test "should get login" do
    get user2s_login_url
    assert_response :success
  end

  test "should get logout" do
    get user2s_logout_url
    assert_response :success
  end
end
