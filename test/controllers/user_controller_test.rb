require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get user_home_url
    assert_response :success
  end

  test "should get create" do
    get user_create_url
    assert_response :success
  end

  test "should get subscribe" do
    get user_subscribe_url
    assert_response :success
  end

  test "should get new" do
    get user_new_url
    assert_response :success
  end

  test "should get edit" do
    get user_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_update_url
    assert_response :success
  end

end
