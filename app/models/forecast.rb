class Forecast

  def initialize(forecast_data)
    @forecast_data = forecast_data
  end

  def id
    "#{current_time}/" + "#{@forecast_data[:latitude]}/" + "#{@forecast_data[:longitude]}"
  end

  def current_weather
    @forecast_data[:currently]
  end

  def current_time
    current_weather[:time]
  end

  def current_summary
    current_weather[:summary]
  end

  def current_icon
    current_weather[:icon]
  end

  def current_temperature
    current_weather[:temperature]
  end

  def current_humidity
    current_weather[:humidity]
  end

  def current_visibility
    current_weather[:visibility]
  end

  def current_uv_index
    current_weather[:uvIndex]
  end

  def current_apparant_temperature
    current_weather[:apparentTemperature]
  end

  def hourly_summary
    @forecast_data[:hourly][:summary]
  end

  def hourly_weather
    @forecast_data[:hourly][:data]
  end

  # def hourly_time
  #   # hourly_weather[0][:time]
  #   hourly_weather.map do |hour|
  #     hour[:time]
  #   end
  # end
  #
  # def hourly_summary
  #   hourly_weather[0][:summary]
  # end
  #
  # def hourly_icon
  #   hourly_weather[0][:icon]
  # end
  #
  # def hourly_precip_prob
  #   hourly_weather[0][:precipProbability]
  # end
  #
  # def hourly_temp
  #   hourly_weather[0][:temperature]
  # end
  #
  # def hourly_apparant_temp
  #   hourly_weather[0][:apparentTemperature]
  # end
  #
  # def hourly_humidity
  #   hourly_weather[0][:humidity]
  # end

  def daily_summary
    @forecast_data[:daily][:summary]
  end

  def daily_weather
    @forecast_data[:daily][:data]
  end

  # def daily_time
  #   daily_weather.map do |day|
  #     day[:time]
  #   end
  # end
  #
  # def daily_icon
  #   daily_weather.map do |day|
  #     day[:icon]
  #   end
  # end
  #
  # def daily_precip_prob
  #   daily_weather.map do |day|
  #     day[:precipProbability]
  #   end
  # end
  #
  # def daily_precip_typ
  #   daily_weather.map do |day|
  #     day[:precipType]
  #   end
  # end
  #
  # def daily_temp_high
  #   daily_weather.map do |day|
  #     day[:temperatureHigh]
  #   end
  # end
  #
  # def daily_temp_low
  #   daily_weather.map do |day|
  #     day[:temperatureLow]
  #   end
  # end
end
