class Genre < ApplicationRecord

  belongs_to :large_category, optional: true

end
