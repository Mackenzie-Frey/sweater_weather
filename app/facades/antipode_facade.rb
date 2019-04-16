class AntipodeFacade
  def initialize(look_up_city)
    @look_up_city = look_up_city
  end

  def antipode
    coordinates = LocationService.new.location(@look_up_city)

    antipode_coordinates = AmypodeService.new.antipode(coordinates)[:data][:attributes]

    forecast_data = ForecastService.new(antipode_coordinates[:lat], antipode_coordinates[:long]).forecast
    antipode_forecast = Forecast.new(forecast_data)

    antipode_city_name = LocationService.new.city(antipode_coordinates[:lat], antipode_coordinates[:long])

    Antipode.new(@look_up_city, antipode_city_name, antipode_forecast)
  end
end
