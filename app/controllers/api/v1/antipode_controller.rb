class Api::V1::AntipodeController < ApplicationController
  def show
    look_up_city = look_up_params['loc']
    lat = LocationService.new(look_up_city).lat
    long = LocationService.new(look_up_city).long

    antipode = AmypodeService.new(lat, long).antipode

    forecast_data = ForecastFacade.new(antipode).forecast

    # render json: ForecastSerializer.new(Forecast.new(forecast_data))

    render json: AntipodeSerializer.new(look_up_city, forecast_data)
  end

  private
  def look_up_params
    params.permit(:loc)
  end
end
