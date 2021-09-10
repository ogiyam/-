class SmallCategory < ApplicationRecord

   has_many :large_categories, dependent: :destroy

   validates :title, presence: true, length: { maximum: 30 }
   validates :note, presence: true
end
