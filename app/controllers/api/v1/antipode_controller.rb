class Api::V1::AntipodeController < ApplicationController
  def show
    # look_up_city = look_up_params['loc']
    # lat = LocationService.new(look_up_city).lat
    # long = LocationService.new(look_up_city).long
    #
    # antipode_lat = AmypodeService.new(lat, long).antipode_lat
    # antipode_long = AmypodeService.new(lat, long).antipode_long
    #
    # forecast_data = ForecastService.new(antipode_lat, antipode_long).forecast
    # antipode_forecast = Forecast.new(forecast_data)
    #
    # antipode_city_name = ReverseGeocodingService.new(antipode_lat, antipode_long).city
    #
    # antipode = Antipode.new(look_up_city, antipode_city_name, antipode_forecast)

    antipode = AntipodeFacade.new(look_up_params['loc']).antipode
    #outputs antipode object

    render json: AntipodeSerializer.new(antipode)
  end

  private
  def look_up_params
    params.permit(:loc)
  end
end
