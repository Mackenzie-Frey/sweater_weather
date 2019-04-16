module CurrentWeather
  def current_time
    currently[:time]
  end

  def current_summary
    currently[:summary]
  end

  def current_icon
    currently[:icon]
  end

  def current_temperature
    currently[:temperature]
  end

  def current_humidity
    currently[:humidity]
  end

  def current_visibility
    currently[:visibility]
  end

  def current_uv_index
    currently[:uvIndex]
  end

  def current_apparant_temperature
    currently[:apparentTemperature]
  end
end
