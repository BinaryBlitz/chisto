class Laundry < ApplicationRecord
  validates :category, inclusion: { in: %w(economy premium) }
  validates :name, :description, presence: true
end
