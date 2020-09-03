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

  def self.find_or_create_with_oauth(auth)
    u = User.find_by_uid(auth["uid"]) || User.find_or_create_by_email(auth)
    u.email = auth["info"]["email"]
    u.uid = auth["uid"]
    binding.pry
    u.save
    u
  end

  def self.find_or_create_by_email(auth)
    User.find_or_create_by(email: auth["info"]["email"]) do |u|
      u.uid = auth["uid"]
      u.password = SecureRandom.hex(20)
      u.username = auth["info"]["name"]
    end
  end
end
