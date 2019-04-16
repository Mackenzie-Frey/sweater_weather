class Api::V1::FavoritesController < ApiController
  def create
    user = User.find_by(api_key: json_body[:api_key])
    if user
      FavoriteCity.create(user: user, city: json_body[:location])
    else
      render json: {}, status: 401
    end
  end

  private
  def json_body
    JSON.parse(request.raw_post, symbolize_names: true)
  end
end
