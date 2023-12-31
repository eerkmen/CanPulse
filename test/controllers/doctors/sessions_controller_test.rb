require "test_helper"

class Doctors::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get doctors_sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get doctors_sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get doctors_sessions_destroy_url
    assert_response :success
  end
end
