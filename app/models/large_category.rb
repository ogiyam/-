class LargeCategory < ApplicationRecord

 belongs_to :user
 has_many :small_categories, dependent: :destroy
 has_many :genres, dependent: :destroy

 validates :problem, presence: true, length: { maximum: 30 }
 validates :solution, presence: true, length: { maximum: 30 }
end
