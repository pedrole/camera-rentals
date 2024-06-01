require "test_helper"

class CamerasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cameras_index_url
    assert_response :success
  end

  test "should get new" do
    get cameras_new_url
    assert_response :success
  end

  test "should get create" do
    get cameras_create_url
    assert_response :success
  end
end
