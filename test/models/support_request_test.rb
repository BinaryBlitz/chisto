# == Schema Information
#
# Table name: support_requests
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SupportRequestTest < ActiveSupport::TestCase
  setup do
    @support_request = support_requests(:support_request)
  end

  test 'valid' do
    assert @support_request.valid?
  end

  test 'invalid without name, email, content' do
    @support_request.reload.name = nil
    assert @support_request.invalid?

    @support_request.reload.email = nil
    assert @support_request.invalid?

    @support_request.reload.content = nil
    assert @support_request.invalid?
  end
end
