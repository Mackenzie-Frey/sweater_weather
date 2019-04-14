class Api::V1::UsersController < ApplicationController
  def create
    api_key = SecureRandom.hex(12)

    user = User.new(email: input_params['email'],
                    password: input_params['password'],
                    password_confirmation: input_params['password_confirmation'],
                    api_key: api_key)

    if user.save
      # response = UserService.new(user)
      render json: UserSerializer.new(response)
    else
      render json: {status: 400, msg: 'Invalid Parameters'}
    end
  end

  private
  def input_params
    params.permit(:email, :password, :password_confirmation)
  end
end
