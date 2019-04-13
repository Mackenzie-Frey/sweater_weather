require 'rails_helper'

context 'Forecast' do
  it 'exists' do
    forecast_data = ForecastFacade.new('denver,co').forecast
    forecast = Forecast.new(forecast_data)

    expect(forecast).to be_at(Forecast)
  end
end
