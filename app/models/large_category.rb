class LargeCategory < ApplicationRecord

  belongs_to :user
  has_many :middle_categories

  validates :genre, presence: true, length: { maximum: 30 }
end
