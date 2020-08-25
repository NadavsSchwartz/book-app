class Book < ApplicationRecord
  validates_presence_of :title, :author
  validates_with InnocenceValidator
end
