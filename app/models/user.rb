class User < ApplicationRecord
  has_many :books
  has_many :reviews
  has_secure_password
  validates :password, length: { in: 6..72 }
  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username, { case_sensitive: false }

  def reviews_in_last_year
    reviews.in_last_year
  end
end
