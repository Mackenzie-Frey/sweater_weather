require 'rails_helper'

describe Antipode, type: :model do
  antipode_lat = -22.3193039
  antipode_long = -65.8306389

  forecast_data = ForecastService.new(antipode_lat, antipode_long).forecast
  @antipode_forecast = Forecast.new(forecast_data)
  @look_up_city = "hongkong"
  @antipode_city_name = "Jujuy, Argentina"

  it 'exists' do
    antipode = Antipode.new(@look_up_city, @antipode_city_name, @antipode_forecast)

    expect(antipode).to be_a(Antipode)
  end

  it 'has attributes' do

  end
end
