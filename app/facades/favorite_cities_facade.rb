class FavoriteCitiesFacade
  def initialize(cities)
    @cities = cities
  end

  def forecasts
    forecasts = coordinate_collection.map do |coordinates|
      ForecastService.new(coordinates[0], coordinates[1]).forecast
    end
    make_city_forecast_objects(forecasts)
  end

  def coordinate_collection
    @cities.map do |city|
      [ LocationService.new(city, nil, nil).coordinates[:lat],
      LocationService.new(city, nil, nil).coordinates[:lng] ]
    end
  end

  def make_city_forecast_objects(forecasts)
    @cities.zip(forecasts).each do |city_forecast|
      FavoriteCityForecast.new(city_forecast)
    end
  end
end