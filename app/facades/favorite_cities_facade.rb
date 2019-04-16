class FavoriteCitiesFacade
  def initialize(cities)
    @cities = cities
  end

  def forecasts
    binding.pry
    forecasts = coordinate_collection.map do |coordinates|
      binding.pry
      ForecastService.new(coordinates[0], coordinates[1]).forecast
    end
    binding.pry
    make_city_forecast_objects(forecasts)
  end

  def coordinate_collection
    @cities.map do |city|
      [ LocationService.new(city, nil, nil).coordinates[:lat],
      LocationService.new(city, nil, nil).coordinates[:lng] ]
    end
  end

  def make_city_forecast_objects(forecasts)
    binding.pry
    @cities.zip(forecasts).each do |city_forecast|
      binding.pry
      FavoriteCityForecast.new(city_forecast)
    end
  end
end
