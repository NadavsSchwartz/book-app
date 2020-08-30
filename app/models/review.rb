class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  scope :in_last_year, -> {where('created_at >= ?', 1.year.ago)}

end
