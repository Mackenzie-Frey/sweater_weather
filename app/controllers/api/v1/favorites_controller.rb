class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: favorite_params[:api_key])

    if user
      FavoriteCity.create(user: user, city: favorite_params[:location])
    else
      render json: {}, status: 401
    end
  end

  private
  def favorite_params
    params.permit(:location, :api_key)
  end
end
