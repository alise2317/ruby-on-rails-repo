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

  # test "should get 4 for view with 50" do
  #   controller1 = PagesController.new
  #   controller1.result(4)
  # end

  test "should get 4 for view with 50" do
    get automorf_number_view_url, params: {val: 50}
    assert_equal 4, assigns(:result)
    assert_response :success
  end

end
