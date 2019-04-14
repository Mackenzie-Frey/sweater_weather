class Api::V1::UsersController < ApplicationController
  def create
    user = User.create!(params['email'], params['password'], params['password_confirmation'])
    response = UserService.new(user)
    render json: UserSerializer.new(response)
  end
end
