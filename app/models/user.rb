class User < ApplicationRecord
  has_secure_password
  validates :password, length: { in: 6..72 }
  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username { case_sensitive: false }
end
