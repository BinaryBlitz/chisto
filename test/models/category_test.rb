# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :string
#  icon        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = categories(:category)
  end

  test 'invalid without name' do
    @category.name = nil
    assert @category.invalid?
  end
end