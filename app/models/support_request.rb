# == Schema Information
#
# Table name: support_requests
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  email      :string           not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SupportRequest < ApplicationRecord
  validates :name, :email, :content, presence: true
  validates :email, email: true
end
