require 'test_helper'

class Partner::RatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'partner.domain.com'
    sign_in_laundry
    @rating = ratings(:rating)
  end

  test 'should get index' do
    get partner_ratings_path
    assert_response :success
  end
end
