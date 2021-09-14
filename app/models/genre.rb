class Genre < ApplicationRecord

  has_many :large_categories, dependent: :destroy

  validates :genre, presence: true

end
