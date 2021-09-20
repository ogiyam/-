class Genre < ApplicationRecord

  has_many :large_categories, dependent: :destroy

  validates :name, presence: true

end
