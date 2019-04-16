class FavoriteCityForecast
  include CurrentWeather

  def initialize(city_forecast)
    @city_forecast = city_forecast
  end

  def id
    "#{current_time}/" + "#{lat}/" + "#{long}"
  end

  def lat
    @city_forecast[1][:latitude]
  end

  def long
    @city_forecast[1][:longitude]
  end

  def location
    @city_forecast[0]
  end

  def currently
    @city_forecast[1][:currently]
  end

  def current_weather
    { current_time: current_time,
      current_summary: current_summary,
      current_icon: current_icon,
      current_temperature: current_temperature,
      current_humidity: current_humidity,
      current_visibility: current_visibility,
      current_uv_index: current_uv_index,
      current_apparant_temperature: current_apparant_temperature }
  end
end
