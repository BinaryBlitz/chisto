require 'test_helper'

class Admin::LaundriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'admin.domain.com'
    sign_in_admin
    @laundry = laundries(:laundry)
    @city = @laundry.city
  end

  test 'should get index' do
    get admin_city_laundries_path(@city)
    assert_response :success
  end

  test 'should get show' do
    get admin_laundry_path(@laundry)
    assert_response :success
  end

  test 'should create laundry' do
    @laundry.destroy

    assert_difference 'Laundry.count' do
      post admin_city_laundries_url(@city), params: {
        laundry: @laundry.attributes.merge(
          background_image: fixture_file_upload('public/blank.jpg'),
          logo: fixture_file_upload('public/blank.jpg'),
          password: 'password'
        )
      }
    end
  end

  test 'should update laundry' do
    new_name = 'Another name'
    patch admin_laundry_path(@laundry), params: { laundry: { name: new_name } }
    assert_redirected_to admin_city_laundries_path(@city)
    assert_equal new_name, @laundry.reload.name
  end

  test 'should destroy laundry' do
    assert_difference 'Laundry.count', -1 do
      delete admin_laundry_url(@laundry)
    end

    assert_redirected_to admin_city_laundries_path(@city)
  end
end
