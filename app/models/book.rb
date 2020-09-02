class Book < ApplicationRecord
  belongs_to :user
  belongs_to :author
  has_many :reviews
  validates_presence_of :title, :author
  validates_with InnocenceValidator

end
