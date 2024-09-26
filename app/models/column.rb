class Column < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :table

  validates :name, presence: true
  validates :table_id, presence: true
  validates :name, length: { minimum: 2, maximum: 16 }
end
