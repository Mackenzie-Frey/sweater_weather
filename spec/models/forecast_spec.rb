require 'rails_helper'

context 'Forecast' do
  before :each do
    forecast_data = ForecastFacade.new('denver,co').forecast
    @forecast = Forecast.new(forecast_data)
  end

  it 'exists' do
    expect(@forecast).to be_a(Forecast)
  end

  it '#id' do
    expect(@forecast.id).to be_a(String)
  end

  context 'current' do
    it '#current_weather' do
      expect(@forecast.current_weather).to be_a(Hash)
      expect(@forecast.current_weather).to have_key(:time)
      expect(@forecast.current_weather).to have_key(:summary)
      expect(@forecast.current_weather).to have_key(:icon)
      expect(@forecast.current_weather).to have_key(:temperature)
      expect(@forecast.current_weather).to have_key(:humidity)
      expect(@forecast.current_weather).to have_key(:visibility)
      expect(@forecast.current_weather).to have_key(:uvIndex)
      expect(@forecast.current_weather).to have_key(:apparentTemperature)
    end

    it '#current_time' do
      expect(@forecast.current_time).to be_a(Integer)
    end

    it '#current_summary' do
      expect(@forecast.current_summary).to be_a(String)
    end

    it '#current_icon' do
      expect(@forecast.current_icon).to be_a(String)
    end

    it '#current_temperature' do
      expect(@forecast.current_temperature).to be_a(Float)
    end

    it '#current_humidity' do
      expect(@forecast.current_humidity).to be_a(Float)
    end

    it '#current_visibility' do
      expect(@forecast.current_visibility).to be_a(Float)
    end

    it '#current_uv_index' do
      expect(@forecast.current_uv_index).to be_a(Integer)
    end

    it '#current_apparant_temperature' do
      expect(@forecast.current_apparant_temperature).to be_a(Float)
    end
  end

  context 'hourly' do
    it '#hourly_summary' do
      expect(@forecast.hourly_summary).to be_a(String)
    end

    it '#hourly_weather' do
      expect(@forecast.hourly_weather).to be_a(Array)
      expect(@forecast.hourly_weather[0]).to have_key(:time)
      expect(@forecast.hourly_weather[0]).to have_key(:summary)
      expect(@forecast.hourly_weather[0]).to have_key(:icon)
      expect(@forecast.hourly_weather[0]).to have_key(:precipProbability)
      expect(@forecast.hourly_weather[0]).to have_key(:temperature)
      expect(@forecast.hourly_weather[0]).to have_key(:apparentTemperature)
      expect(@forecast.hourly_weather[0]).to have_key(:humidity)
    end
  end

  context 'daily' do
    it '#daily_summary' do
      expect(@forecast.daily_summary).to be_a(String)
    end

    it '#daily_weather' do
      expect(@forecast.daily_weather).to be_a(Array)
      expect(@forecast.daily_weather[0]).to be_a(Hash)
      expect(@forecast.daily_weather[0]).to have_key(:time)
      expect(@forecast.daily_weather[0]).to have_key(:icon)
      expect(@forecast.daily_weather[0]).to have_key(:precipProbability)
      expect(@forecast.daily_weather[0]).to have_key(:precipType)
      expect(@forecast.daily_weather[0]).to have_key(:temperatureHigh)
      expect(@forecast.daily_weather[0]).to have_key(:temperatureLow)
    end
  end
end
