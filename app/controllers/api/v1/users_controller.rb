class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(email: input_params['email'],
                    password: input_params['password'],
                    password_confirmation: input_params['password_confirmation'],
                    api_key: ApiKey.new.key)

    render_json(user)
  end

  private
  def input_params
    params.permit(:email, :password, :password_confirmation)
  end

  def render_json(user)
    if user.save
      render json: UserSerializer.new(user), status: 200
    else
      render json: {status: 400, msg: 'Invalid Parameters'}
    end
  end
end
