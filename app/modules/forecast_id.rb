module ForecastId
  def id
    "#{current_time}/" + "#{@forecast_data.lat}/" + "#{@forecast_data.long}"
  end
end
