require 'test_helper'

class API::RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rating = ratings(:rating)
    @laundry = @rating.laundry
  end

  test 'should create rating' do
    @rating.destroy

    assert_difference 'Rating.count' do
      post api_laundry_ratings_path(@laundry, api_token: api_token), params: {
        rating: @rating.attributes
      }
    end

    assert_response :created
  end
end
