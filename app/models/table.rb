class Table < ApplicationRecord
  has_many :columns, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
end
