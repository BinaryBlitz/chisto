require 'test_helper'

class API::UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
  end

  test 'should get show' do
    get api_user_path(@user)
    assert_response :success
  end


  test 'should create user' do
    @user.destroy

    assert_difference 'User.count' do
      post api_user_url(@user), params: { user: @user.attributes }
    end

    assert_response :created
  end

  test 'should update user' do
    new_name = 'Another name'
    patch api_user_path(@user), params: { user: { first_name: new_name } }
    assert_response :ok
    assert_equal new_name, @user.reload.first_name
  end
end
