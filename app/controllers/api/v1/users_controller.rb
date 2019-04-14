class Api::V1::UsersController < ApplicationController
  def create
    api_key = SecureRandom.hex(12)
    #Make an api key object in initalize make key with attr_reader
    user = User.new(email: input_params['email'],
                    password: input_params['password'],
                    password_confirmation: input_params['password_confirmation'],
                    api_key: api_key)

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
