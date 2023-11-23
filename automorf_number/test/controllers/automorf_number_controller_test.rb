require "test_helper"

class AutomorfNumberControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get automorf_number_input_url
    assert_response :success
  end

  test "should get view" do
    get automorf_number_view_url
    assert_response :success
  end
end
