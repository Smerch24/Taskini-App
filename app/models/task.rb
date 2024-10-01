class Task < ApplicationRecord
  belongs_to :column
  validates :name, presence: true
  validates :status, presence: true
  validates :priority, presence: true

  enum status: { undone: 0, done: 10 }
  enum priority: { regular: 0, medium: 10, extra: 20 }
end
