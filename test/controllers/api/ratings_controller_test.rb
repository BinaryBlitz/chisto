require 'test_helper'

class API::RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rating = ratings(:rating)
    @laundry = @rating.laundry
  end

  test 'should get index' do
    get api_laundry_ratings_path(@laundry)
    assert_response :success
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

  test 'should update rating' do
    new_value = 3
    new_content = 'New content'

    patch api_rating_path(@rating, api_token: api_token), params: {
      rating: { value: new_value, content: new_content }
    }

    assert_response :ok

    assert_equal @rating.reload.value, new_value
    assert_equal @rating.reload.content, new_content
  end
end
