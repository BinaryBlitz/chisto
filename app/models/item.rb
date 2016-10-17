# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  category_id :integer
#  name        :string           not null
#  icon        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Item < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :icon, presence: true
end