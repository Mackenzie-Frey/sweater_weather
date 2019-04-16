class Forecast
  include CurrentWeather
  include ForecastId

  def initialize(forecast_data)
    @forecast_data = forecast_data
  end

  # def id
  #   "#{current_time}/" + "#{@forecast_data.lat}/" + "#{@forecast_data.long}"
  # end

  def lat
    @forecast_data[:latitude]
  end

  def long
    @forecast_data[:longitude]
  end

  def currently
    @forecast_data[:currently]
  end

  # def current_time
  #   current_weather[:time]
  # end
  #
  # def current_summary
  #   current_weather[:summary]
  # end
  #
  # def current_icon
  #   current_weather[:icon]
  # end
  #
  # def current_temperature
  #   current_weather[:temperature]
  # end
  #
  # def current_humidity
  #   current_weather[:humidity]
  # end
  #
  # def current_visibility
  #   current_weather[:visibility]
  # end
  #
  # def current_uv_index
  #   current_weather[:uvIndex]
  # end
  #
  # def current_apparant_temperature
  #   current_weather[:apparentTemperature]
  # end

  def hourly_summary
    @forecast_data[:hourly][:summary]
  end

  def hourly_weather
    @forecast_data[:hourly][:data]
  end

  def daily_summary
    @forecast_data[:daily][:summary]
  end

  def daily_weather
    @forecast_data[:daily][:data]
  end
end
