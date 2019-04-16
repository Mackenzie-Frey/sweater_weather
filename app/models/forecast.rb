class Forecast
  include CurrentWeather

  def initialize(forecast_data)
    @forecast_data = forecast_data
  end

  def id
    "#{current_time}/" + "#{lat}/" + "#{long}"
  end

  def lat
    @forecast_data[:latitude]
  end

  def long
    @forecast_data[:longitude]
  end

  def currently
    @forecast_data[:currently]
  end

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
