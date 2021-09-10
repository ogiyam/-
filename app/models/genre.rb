class Genre < ApplicationRecord
  
  belongs_to :large_category
  belongs_to :user
  
end
