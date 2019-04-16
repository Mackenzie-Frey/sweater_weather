class Api::V1::ForecastController < ApiController
  def show
    forecast_data = ForecastFacade.new(look_up_params).forecast
    render json: ForecastSerializer.new(Forecast.new(forecast_data))
  end

  private
  def look_up_params
    params['location']
  end
end
