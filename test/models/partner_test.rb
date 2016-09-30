require 'test_helper'

class PartnerTest < ActiveSupport::TestCase
  setup do
    @partner = partners(:partner)
  end

  test 'valid' do
    assert @partner.valid?
  end
end
