require 'test_helper'

class TodoControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get todo_controller_index_url
    assert_response :success
  end

  test "should get create" do
    get todo_controller_create_url
    assert_response :success
  end

  test "should get update" do
    get todo_controller_update_url
    assert_response :success
  end

end
