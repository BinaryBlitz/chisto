# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  category_id    :integer
#  name           :string           not null
#  icon           :string
#  description    :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  use_area       :boolean          default(FALSE)
#  deleted_at     :datetime
#  long_treatment :boolean          default(FALSE)
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  setup do
    @item = items(:item)
  end

  test 'invalid without name' do
    @item.name = nil
    assert @item.invalid?
  end
end
