class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :large_categories, dependent: :destroy
  has_many :todos, dependent: :destroy


  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true


  has_one_attached :image
  validate :image_type

  private

  def image_type
   if !image.blob.content_type.in?(%('image/jpeg image/jpg image/png'))
    image.purge
    errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
   end
  end

end
