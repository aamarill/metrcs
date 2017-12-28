require 'test_helper'

class RegisteredApplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get registered_application_create_url
    assert_response :success
  end

  test "should get read" do
    get registered_application_read_url
    assert_response :success
  end

  test "should get update" do
    get registered_application_update_url
    assert_response :success
  end

  test "should get delete" do
    get registered_application_delete_url
    assert_response :success
  end

end
