# == Schema Information
#
# Table name: partner_applications
#
#  id                  :integer          not null, primary key
#  representative_name :string           not null
#  laundry_name        :string           not null
#  city                :string
#  phone_number        :string
#  email               :string
#  content             :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'test_helper'

class PartnerApplicationTest < ActiveSupport::TestCase
  setup do
    @partner_application = partner_applications(:partner_application)
  end

  test 'valid' do
    assert @partner_application.valid?
  end
end
