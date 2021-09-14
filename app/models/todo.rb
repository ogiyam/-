class Todo < ApplicationRecord

  belongs_to :user, optional: true

  validates :task, presence: true
end
