class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :large_categories, dependent: :destroy
  has_many :todos, dependent: :destroy

  validates :name, presence: true
  validates :goal, length: { maximum: 30 }
end
