require 'rails_helper'

context 'Forescast Service' do
    it 'exists' do
      forecast = ForecastService.new(params)
      expect(forecast).to_be_an_instance_of(ForecastService)
    end

  context 'returns weather data when given a' do
    it 'lat & long' do

    end

    it 'city' do

    end
  end
end
