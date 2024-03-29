# == Schema Information
#
# Table name: treatments
#
#  id          :integer          not null, primary key
#  item_id     :integer
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  deleted_at  :datetime
#

class Treatment < ApplicationRecord
  include SoftDeletable

  belongs_to :item

  has_many :order_items
  has_many :order_treatments, dependent: :destroy
  has_many :laundry_treatments, dependent: :destroy
  has_many :laundries, through: :laundry_treatments

  validates :name, presence: true

  # Soft deleted association
  def item
    Item.unscoped { super }
  end
end
