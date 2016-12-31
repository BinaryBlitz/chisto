# == Schema Information
#
# Table name: statuses
#
#  id         :integer          not null, primary key
#  state      :integer          default(0)
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  setup do
    @status = statuses(:status)
  end

  test 'valid' do
    assert @status.valid?
  end
end
