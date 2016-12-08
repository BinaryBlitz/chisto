# == Schema Information
#
# Table name: laundry_items
#
#  id                    :integer          not null, primary key
#  laundry_id            :integer
#  item_id               :integer
#  decoration_multiplier :float            default(1.0)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class LaundryItem < ApplicationRecord
  belongs_to :laundry
  belongs_to :item

  has_many :laundry_treatments, dependent: :destroy

  validates :decoration_multiplier, numericality: { greater_than_or_equal_to: 1.0 }
end