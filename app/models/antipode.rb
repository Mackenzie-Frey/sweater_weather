class Antipode
  def initialize(look_up_city, antipode_city_name, antipode_forecast)
    @look_up_city = look_up_city
    @antipode_city_name = antipode_city_name
    @antipode_forecast = antipode_forecast
  end

  def id
    "#{@antipode_forecast.current_time}/" + "#{@antipode_forecast.lat}/" + "#{@antipode_forecast.long}"
  end

  def location_name
    @antipode_city_name
  end

  def forecast
    {summary: @antipode_forecast.current_summary,
      current_temperature: @antipode_forecast.current_temperature}
  end

  def search_location
    @look_up_city
  end
end
