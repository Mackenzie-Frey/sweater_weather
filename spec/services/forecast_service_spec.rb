require 'rails_helper'

describe ForecastService do
  before :each do
    @lat = 39.7392358
    @long = -104.990251
  end

  it 'exists' do
    forecast = ForecastService.new(@lat, @long)

    expect(forecast).to be_a(ForecastService)
  end

  it 'returns weather data when given a latitude and longitude' do
    forecast = ForecastService.new(@lat, @long).forecast

    expect(forecast).to be_a(Hash)

    expect(forecast[:currently]).to have_key(:time)
    expect(forecast[:currently]).to have_key(:summary)
    expect(forecast[:currently]).to have_key(:icon)
    expect(forecast[:currently]).to have_key(:temperature)
    expect(forecast[:currently]).to have_key(:humidity)
    expect(forecast[:currently]).to have_key(:visibility)
    expect(forecast[:currently]).to have_key(:uvIndex)
    expect(forecast[:currently]).to have_key(:apparentTemperature)

    expect(forecast[:hourly]).to have_key(:summary)
    expect(forecast[:hourly][:data][0]).to have_key(:time)
    expect(forecast[:hourly][:data][0]).to have_key(:summary)
    expect(forecast[:hourly][:data][0]).to have_key(:icon)
    expect(forecast[:hourly][:data][0]).to have_key(:precipProbability)
    expect(forecast[:hourly][:data][0]).to have_key(:temperature)
    expect(forecast[:hourly][:data][0]).to have_key(:apparentTemperature)
    expect(forecast[:hourly][:data][0]).to have_key(:humidity)


    expect(forecast[:daily]).to have_key(:summary)
    expect(forecast[:daily][:data][0]).to have_key(:time)
    expect(forecast[:daily][:data][0]).to have_key(:icon)
    expect(forecast[:daily][:data][0]).to have_key(:precipProbability)
    expect(forecast[:daily][:data][0]).to have_key(:precipType)
    expect(forecast[:daily][:data][0]).to have_key(:temperatureHigh)
    expect(forecast[:daily][:data][0]).to have_key(:temperatureLow)
  end
end
