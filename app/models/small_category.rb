class SmallCategory < ApplicationRecord
  
  belongs_to :middle_category
  
  validates :title, presence: true
  validates :note, presence: true
end
