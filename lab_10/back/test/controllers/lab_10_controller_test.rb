require "test_helper"

class Lab10ControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get lab_10_input_url
    assert_response :success
  end

  test "should get view" do
    get lab_10_view_url
    assert_response :success
  end
end
