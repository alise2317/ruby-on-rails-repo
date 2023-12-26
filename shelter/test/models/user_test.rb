require 'test_helper'
class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
  end
  test "should be valid" do
    assert @user.valid?
  end
  test "email should be present" do
    @user.email = ""
    assert_not @user.valid?
  end
  test "email should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end
  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end
  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
  test "should have a role" do
    assert_includes User.roles.keys, @user.role
  end
  test "default role should be user" do
    new_user = User.new(email: 'test@example.com', password: 'password123')
    assert_equal 'user', new_user.role
  end
end
