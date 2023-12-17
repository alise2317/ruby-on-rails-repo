require "test_helper"

class Lab9ControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get lab_9_input_url
    assert_response :success
  end

  test "should get view" do
    get lab_9_view_url
    assert_response :success
  end
end
