class Api::V1::ForecastController < ApplicationController
  def show
    location = LocationService.new(look_up_params).location
    forecast = ForecastService.new(location.lat, location.long)
    render json: ForecastSerializer.new(forecast)
  end

  private
  def look_up_params
    params['location']
  end
end
