class User < ApplicationRecord
  has_many :favorite_cities
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password_digest, :api_key
  has_secure_password
end
