require 'test_helper'

class Admin::CitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'admin.domain.com'
    sign_in_admin
    @city = cities(:city)
  end

  test 'should get index' do
    get admin_cities_path
    assert_response :success
  end

  test 'should create city' do
    @city.destroy

    assert_difference 'City.count' do
      post admin_cities_url(@city), params: { city: @city.attributes }
    end
  end

  test 'should update city' do
    new_name = 'Another name'
    patch admin_city_path(@city), params: { city: { name: new_name } }
    assert_redirected_to admin_cities_path
    assert_equal new_name, @city.reload.name
  end

  test 'should destroy city' do
    assert_difference 'City.count', -1 do
      delete admin_city_url(@city)
    end

    assert_redirected_to admin_cities_path
  end
end
