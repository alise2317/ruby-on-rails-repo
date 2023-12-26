require 'test_helper'
class UserRegistrationTest < ActionDispatch::IntegrationTest
  test "can register a user" do
    get new_user_registration_path
    assert_difference 'User.count', 1 do
      post user_registration_path, params: { user: {email: 'test@example.com', password: 'password', password_confirmation: 'password' } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
  end
end
