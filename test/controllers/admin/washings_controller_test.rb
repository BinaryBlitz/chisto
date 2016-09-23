require 'test_helper'

class Admin::WashingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @washing = washings(:washing)
  end

  test 'should get index' do
    get admin_washings_path
    assert_response :success
  end

  test 'should get show' do
    get admin_washing_path(@washing)
    assert_response :success
  end

  test 'should create washing' do
    @washing.destroy

    assert_difference 'Washing.count' do
      post admin_washings_url(@washing), params: {
        washing: @washing.attributes.merge(
          image: fixture_file_upload('public/blank.jpg'),
          logo: fixture_file_upload('public/blank.jpg')
        )
      }
    end
  end

  test 'should update washing' do
    new_name = 'Another name'
    patch admin_washing_path(@washing), params: { washing: { name: new_name } }
    assert_redirected_to admin_washings_path
    assert_equal new_name, @washing.reload.name
  end

  test 'should destroy washing' do
    assert_difference 'Washing.count', -1 do
      delete admin_washing_url(@washing)
    end

    assert_redirected_to admin_washings_path
  end
end
