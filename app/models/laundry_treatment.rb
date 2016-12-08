# == Schema Information
#
# Table name: laundry_treatments
#
#  id           :integer          not null, primary key
#  treatment_id :integer
#  price        :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  laundry_id   :integer
#

class LaundryTreatment < ApplicationRecord
  belongs_to :treatment
  belongs_to :laundry

  has_many :line_items

  validates :price, numericality: { greater_than: 0 }
  validates :treatment, uniqueness: { scope: :laundry }
end
