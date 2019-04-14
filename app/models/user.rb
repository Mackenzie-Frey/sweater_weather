class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, :api_key, presence: true
  has_secure_password
end
