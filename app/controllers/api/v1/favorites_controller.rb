class Api::V1::FavoritesController < ApiController
  def create
    if user
      FavoriteCity.create(user: user, city: json_body[:location])
    else
      render_401
    end
  end

  def index
    if user
      fav_cities_forecasts = FavoriteCitiesFacade.new(extract_city_names(user)).forecasts
      render json: fav_cities_forecasts, status: 200
    else
      render_401
    end
  end

  def destroy
    if user
      deleted_city = user.favorite_cities.find_by(city: json_body[:location]).destroy!
      deleted_city_forecast = FavoriteCitiesFacade.new([deleted_city.city]).forecasts
      render json: deleted_city_forecast, status: 200
    else
      render_401
    end
  end

  private
  def json_body
    JSON.parse(request.raw_post, symbolize_names: true)
  end

  def extract_city_names(user)
    user.favorite_cities.map do |fav_city|
      fav_city.city
    end.uniq
  end

  def user
    User.find_by(api_key: json_body[:api_key])
  end
end
