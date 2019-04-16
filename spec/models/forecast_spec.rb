require 'rails_helper'

describe 'Forecast', type: :model do
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

  it '#lat' do
    expect(@forecast.lat).to eq(39.7392358)
  end

  it '#long' do
    expect(@forecast.long).to eq(-104.990251)
  end

  context 'current' do
    it '#currently' do
      current_weather = @forecast.currently

      expect(current_weather).to be_a(Hash)
      expect(current_weather).to have_key(:time)
      expect(current_weather).to have_key(:summary)
      expect(current_weather).to have_key(:icon)
      expect(current_weather).to have_key(:temperature)
      expect(current_weather).to have_key(:humidity)
      expect(current_weather).to have_key(:visibility)
      expect(current_weather).to have_key(:uvIndex)
      expect(current_weather).to have_key(:apparentTemperature)
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
      expect(@forecast.current_temperature).to be_a(Float).or(be_a(Integer))
    end

    it '#current_humidity' do
      expect(@forecast.current_humidity).to be_a(Float).or(be_a(Integer))
    end

    it '#current_visibility' do
      expect(@forecast.current_visibility).to be_a(Float).or(be_a(Integer))
    end

    it '#current_uv_index' do
      expect(@forecast.current_uv_index).to be_a(Integer).or(be_a(Float))
    end

    it '#current_apparant_temperature' do
      expect(@forecast.current_apparant_temperature).to be_a(Float).or(be_a(Integer))
    end
  end

  context 'hourly' do
    it '#hourly_summary' do
      expect(@forecast.hourly_summary).to be_a(String)
    end

    it '#hourly_weather' do
      hourly_weather = @forecast.hourly_weather

      expect(hourly_weather).to be_a(Array)
      expect(hourly_weather[0]).to have_key(:time)
      expect(hourly_weather[0]).to have_key(:summary)
      expect(hourly_weather[0]).to have_key(:icon)
      expect(hourly_weather[0]).to have_key(:precipProbability)
      expect(hourly_weather[0]).to have_key(:temperature)
      expect(hourly_weather[0]).to have_key(:apparentTemperature)
      expect(hourly_weather[0]).to have_key(:humidity)
    end
  end

  context 'daily' do
    it '#daily_summary' do
      expect(@forecast.daily_summary).to be_a(String)
    end

    it '#daily_weather' do
      daily_weather = @forecast.daily_weather

      expect(daily_weather).to be_a(Array)
      expect(daily_weather[0]).to be_a(Hash)
      expect(daily_weather[0]).to have_key(:time)
      expect(daily_weather[0]).to have_key(:icon)
      expect(daily_weather[0]).to have_key(:precipProbability)
      expect(daily_weather[0]).to have_key(:temperatureHigh)
      expect(daily_weather[0]).to have_key(:temperatureLow)
    end
  end
end
