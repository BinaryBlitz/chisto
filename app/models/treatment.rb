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
#

class Treatment < ApplicationRecord
  belongs_to :item

  validates :name, presence: true
end
