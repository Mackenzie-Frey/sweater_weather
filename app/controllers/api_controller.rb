class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def render_401
    render json: {}, status: 401
  end
end
