require 'test_helper'
class HomeControllerTest < ActionDispatch::IntegrationTest
  setup do    @card = cards(:one)
  end
  test "should get index" do    get home_index_url
    assert_response :success    assert_not_nil assigns(:k)
  end
  test "should add card to favorites" do    assert_difference('Favorites.count') do
      post add_to_favorites_home_index_url, params: { img_url: @card.img_url }    end
    assert_response :created  end
  test "should handle add to favorites with invalid card" do
    post add_to_favorites_home_index_url, params: { img_url: 'nonexistent_url' }    assert_response :unprocessable_entity
  end
  test "should delete card" do    assert_difference('Card.count', -1) do
      delete delete_home_index_url(@card)
    end  end
  test "should change card description" do
    new_description = "New description"    patch change_home_index_url(@card), params: { description: new_description }
    @card.reload    assert_equal new_description[23..-3], @card.description
    assert_redirected_to root_path  end
end
