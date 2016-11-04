require 'test_helper'

class Partner::LaundriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    host! 'partner.domain.com'
    sign_in_laundry
    @laundry = laundries(:laundry)
  end

  test 'should update laundry' do
    new_name = 'Another name'
    patch partner_laundry_path, params: { laundry: { name: new_name } }
    assert_redirected_to edit_laundry_profile_path
    assert_equal new_name, @laundry.reload.name
  end
end
