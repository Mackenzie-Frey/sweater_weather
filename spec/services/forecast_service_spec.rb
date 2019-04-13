require 'rails_helper'

context 'Forescast Service' do
    it 'exists' do
      forecast = ForecastService.new(params)
      expect(forecast).to be_a(ForecastService)
    end

  it 'returns weather data when given a city' do
    ForecastService.new('denver,co')
    expect()
  end
end
