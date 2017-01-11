# == Schema Information
#
# Table name: subscriptions
#
#  id           :integer          not null, primary key
#  phone_number :string
#  content      :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Subscription < ApplicationRecord
  include Phonable

  validates :content, presence: true
end
