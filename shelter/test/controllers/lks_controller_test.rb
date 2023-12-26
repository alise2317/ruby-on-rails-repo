require 'test_helper'
class LksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite = favorites(:one)
  end
  test "should get index" do
    get lks_url
    assert_response :success
    assert_not_nil
    assigns(:k)
  end
  test "should delete favorite" do
    assert_difference('Favorites.count', -1) do
      delete lks_delete_url(@favorite), params: { id: @favorite.id }
    end
    assert_redirected_to lks_index_url
  end
end
