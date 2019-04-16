class Api::V1::SessionsController < ApiController
  def create
    user = User.find_by(email: login_params['email'])
    authenticate_then_render(user)
  end

  private
  def login_params
    params.permit(:email, :password)
  end

  def authenticate_then_render(user)
    if user && user.authenticate(login_params['password'])
      session[:user_id] = user.id
      render json: UserSerializer.new(user)
    else
      render_401
    end
  end
end
