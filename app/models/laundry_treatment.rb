# == Schema Information
#
# Table name: laundry_treatments
#
#  id           :integer          not null, primary key
#  laundry_id   :integer
#  treatment_id :integer
#  price        :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class LaundryTreatment < ApplicationRecord
  belongs_to :laundry
  belongs_to :treatment

  has_many :line_items

  validates :price, numericality: { greater_than: 0 }
end
