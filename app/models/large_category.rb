class LargeCategory < ApplicationRecord

   belongs_to :user
   has_many :small_categories, dependent: :destroy
   has_many :genres, dependent: :destroy
end
