class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  scope :alphabetical_order, -> { order(:content)}
  scope :in_last_year, -> {where('created_at >= ?', 1.year.ago)}
  scope :last_3, -> { order(created_at: :desc).limit(3)}
end
