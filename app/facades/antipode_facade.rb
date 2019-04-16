class AntipodeFacade
  def initialize(look_up_city)
    @look_up_city = look_up_city
  end

  def antipode
    coordinates = Rails.cache.fetch(@look_up_city) do
        LocationService.new.location(@look_up_city)
      end

    antipode_coordinates = Rails.cache.fetch(coordinates.to_s) do
        AmypodeService.new.antipode(coordinates)[:data][:attributes]
      end

    forecast_data = ForecastService.new(antipode_coordinates[:lat], antipode_coordinates[:long]).forecast
    antipode_forecast = Forecast.new(forecast_data)

    antipode_city_name = Rails.cache.fetch(antipode_coordinates[:lat].to_s + ',' + antipode_coordinates[:long].to_s) do
        LocationService.new.city(antipode_coordinates[:lat], antipode_coordinates[:long])
      end

    Antipode.new(@look_up_city, antipode_city_name, antipode_forecast)
  end
end
