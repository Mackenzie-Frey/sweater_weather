class Api::V1::ForecastController < ApplicationController
  def show
    forecast = ForecastFacade.new(look_up_params).forecast
    render json: ForecastSerializer.new(forecast)
  end

  private
  def look_up_params
    params['location']
  end
end
