class Column < ApplicationRecord
  has_many :tasks, dependent: :destroy
  belongs_to :table

  validates :name, presence: true
end
