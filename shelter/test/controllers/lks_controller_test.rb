require 'test_helper'
class LksControllerTest < ActionDispatch::IntegrationTest  setup do
    @favorite = favorites(:one)  # Assuming you have a fixture named 'one' in favorites.yml  end
  test "should get index" do
    get lks_url    assert_response :success
    assert_not_nil assigns(:k)  # Ensures @k is assigned  end
  test "should delete favorite" do
    assert_difference('Favorites.count', -1) do      delete lks_delete_url(@favorite), params: { id: @favorite.id }
    end
    assert_redirected_to lks_index_url  # Assuming you want to redirect after delete  end
end
