class AntipodeFacade
  def initialize(look_up_city)
    @look_up_city = look_up_city
  end

  def antipode
    lat = LocationService.new(@look_up_city, nil, nil).lat
    long = LocationService.new(@look_up_city, nil, nil).long

    antipode_lat = AmypodeService.new(lat, long).antipode_lat
    antipode_long = AmypodeService.new(lat, long).antipode_long

    forecast_data = ForecastService.new(antipode_lat, antipode_long).forecast
    antipode_forecast = Forecast.new(forecast_data)

    antipode_city_name = LocationService.new(nil, antipode_lat, antipode_long).city

    Antipode.new(@look_up_city, antipode_city_name, antipode_forecast)
  end
end
