class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :large_categories, dependent: :destroy
  has_many :todos, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
