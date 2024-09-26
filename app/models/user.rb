class User < ApplicationRecord
  has_many :tables, dependent: :destroy

  validates :name, presence: true
  validates :name, length: { minimum: 1, maximum: 32 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
