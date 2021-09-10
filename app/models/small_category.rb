class SmallCategory < ApplicationRecord

   has_many :large_categories, dependent: :destroy

   validates :problem, presence: true, length: { maximum: 30 }
   validates :solution, presence: true, length: { maximum: 30 }
end
