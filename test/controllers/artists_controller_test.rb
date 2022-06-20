require "test_helper"

class ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get artists_search_url
    assert_response :success
  end
end
