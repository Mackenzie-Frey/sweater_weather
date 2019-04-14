class User < ApplicationRecord
  def initialize(email, password, password_confirmation)
    @email = email
    @password = password
    @password_confirmation = password_confirmation
  end
end
