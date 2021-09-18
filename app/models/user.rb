class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :large_categories, dependent: :destroy
  has_many :todos, dependent: :destroy

  has_one_attached :image

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  def image_type
   if !image.blob.content_type.in?(%('image/jpeg image/png'))
    image.purge
    errors.add(:image, 'はJPEGまたはPNG形式を選択してアップロードしてください')
   end
  end

end
