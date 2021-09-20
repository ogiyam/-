class LargeCategory < ApplicationRecord

     belongs_to :user
     has_many :small_categories, dependent: :destroy
     belongs_to :genre, optional: true

     validates :problem, presence: true
     validates :solution, presence: true

     scope :search, -> (keyword) {
       where('genre_id like :q OR problem like :q OR solution like :q OR title like :q', q: "%#{keyword}%") if keyword. present?
     }
end