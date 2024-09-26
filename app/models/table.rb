class Table < ApplicationRecord
  has_many :columns, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 16 }
end
