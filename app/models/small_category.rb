class SmallCategory < ApplicationRecord

   belongs_to :large_category
   has_many :stars, dependent: :destroy

   def star_by?(small_category)
      stars.where(small_category_id: small_category.id).exists?
   end

   validates :title, presence: true
   validates :note, presence: true
end
