require 'rails_helper'

context 'Forescast Service' do
  before :each do
    @lat = 39.7392358
    @long = -104.990251
  end

  it 'exists' do
    forecast = ForecastService.new(@lat, @long)

    expect(forecast).to be_a(ForecastService)
  end

  it 'returns weather data when given a latitude and longitude' do
    forecast = ForecastService.new(@lat, @long)

    expect(forecast).to be_a(Hash)
  end
end
