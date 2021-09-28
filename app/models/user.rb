class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :large_categories, dependent: :destroy
  has_many :todos, dependent: :destroy


  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true


  has_one_attached :image
 
  def self.guest
    find_or_create_by(email: 'guest@example.com') do |user|
    user.name = "ゲスト"
    user.password = SecureRandom.urlsafe_base64
    end
  end

end
