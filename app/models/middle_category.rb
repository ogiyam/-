class MiddleCategory < ApplicationRecord
  
  belongs_to :large_category
  has_many :small_categories
  
  validates :problem, presence: true, length: { maximum: 30 }
  validates :solution, presence: true, length: { maximum: 30 }
end
