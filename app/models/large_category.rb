class LargeCategory < ApplicationRecord

 belongs_to :user
 has_many :small_categories, dependent: :destroy
 belongs_to :genre, optional: true

 validates :problem, presence: true
 validates :solution, presence: true
end
