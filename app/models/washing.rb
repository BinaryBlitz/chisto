class Washing < ApplicationRecord
  validates :category, inclusion: { in: %w(econom premium) }
  validates :name, :description, presence: true
end
