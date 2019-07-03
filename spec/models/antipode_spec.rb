require 'rails_helper'

describe Antipode, :vcr, type: :model do
  before :each do
    antipode_lat = -22.3193039
    antipode_long = -65.8306389

    @forecast_data = ForecastService.new(antipode_lat, antipode_long).forecast
    @antipode_forecast = Forecast.new(@forecast_data)
    @look_up_city = "hongkong"
    @antipode_city_name = "Jujuy, Argentina"

    @antipode = Antipode.new(@look_up_city, @antipode_city_name, @antipode_forecast)
  end

  it 'exists' do
    expect(@antipode).to be_a(Antipode)
  end

  it 'id' do
    expect(@antipode.id).to be_a(String)
  end

  it 'location_name' do
    expect(@antipode.location_name).to eq(@antipode_city_name)
  end

  it 'forecast' do
    forecast = {summary: @antipode_forecast.current_summary,
      current_temperature: @antipode_forecast.current_temperature}

    expect(@antipode.forecast).to eq(forecast)
  end

  it 'search_location' do
    expect(@antipode.search_location).to eq(@look_up_city)
  end
end
