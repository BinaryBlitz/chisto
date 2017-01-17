require 'test_helper'

class Admin::RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'admin.domain.com'
    sign_in_admin
    @rating = ratings(:rating)
  end

  test 'should get index' do
    get admin_ratings_path
    assert_response :success
  end

  test 'should update rating' do
    patch admin_rating_path(@rating), params: { rating: { verified: false } }
    assert_redirected_to admin_ratings_path
    assert_equal false, @rating.reload.verified
  end
end
