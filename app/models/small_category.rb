class SmallCategory < ApplicationRecord

   belongs_to :large_category
   has_many :stars, dependent: :destroy

   def star_by?(small_category)
      stars.where(small_category_id: small_category.id).exists?
   end

   validates :title, presence: true
   validates :note, presence: true

   # 保留
   # def self.guest
   #  @user.email = User.find_by(email: 'guest@example.com')
   #  @large_category.user.email = LargeCategory.find_by(email: 'guest@example.com')
   # end
end
