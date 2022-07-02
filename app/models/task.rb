class Task < ApplicationRecord
  validates :name, length: { maximum: 100 }, presence: true
  validates :content, length: { maximum: 500 }, presence: true

  scope :deadline_asc, -> { order(deadline: :ASC) }
end
