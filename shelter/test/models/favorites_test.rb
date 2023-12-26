require 'test_helper'
class FavoritesTest < ActiveSupport::TestCase  def setup
    @favorite = Favorites.new(img_url: "http://example.com/image.jpg", description: "A sample description")  end
  test "should be valid" do
    assert @favorite.valid?  end
  test "img_url should be present" do
    @favorite.img_url = ""    assert_not @favorite.valid?
  end
  test "description should be present" do    @favorite.description = ""
    assert_not @favorite.valid?  end
  test "description should not be too long" do
    @favorite.description = "a" * 256    assert_not @favorite.valid?
  endend
