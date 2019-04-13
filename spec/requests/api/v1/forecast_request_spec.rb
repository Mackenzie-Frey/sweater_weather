require 'rails_helper'

context '/api/v1/forecast?location=denver,co' do
  it 'outputs weather data for a specific location' do

    get '/api/v1/forecast?location=denver,co'

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    
    expect(result[:forecast][:currently]).to have_key(:time)
    expect(result[:forecast][:currently]).to have_key(:summary)
    expect(result[:forecast][:currently]).to have_key(:icon)
    expect(result[:forecast][:currently]).to have_key(:temperature)
    expect(result[:forecast][:currently]).to have_key(:humidity)
    expect(result[:forecast][:currently]).to have_key(:visibility)
    expect(result[:forecast][:currently]).to have_key(:uvIndex)
    expect(result[:forecast][:currently]).to have_key(:apparentTemperature)

    expect(result[:forecast][:hourly]).to have_key(:summary)
    expect(result[:forecast][:hourly][:data][0]).to have_key(:time)
    expect(result[:forecast][:hourly][:data][0]).to have_key(:summary)
    expect(result[:forecast][:hourly][:data][0]).to have_key(:icon)
    expect(result[:forecast][:hourly][:data][0]).to have_key(:precipProbability)
    expect(result[:forecast][:hourly][:data][0]).to have_key(:temperature)
    expect(result[:forecast][:hourly][:data][0]).to have_key(:apparentTemperature)
    expect(result[:forecast][:hourly][:data][0]).to have_key(:humidity)


    expect(result[:forecast][:daily]).to have_key(:summary)
    expect(result[:forecast][:daily][:data][0]).to have_key(:time)
    expect(result[:forecast][:daily][:data][0]).to have_key(:icon)
    expect(result[:forecast][:daily][:data][0]).to have_key(:precipProbability)
    expect(result[:forecast][:daily][:data][0]).to have_key(:precipType)
    expect(result[:forecast][:daily][:data][0]).to have_key(:temperatureHigh)
    expect(result[:forecast][:daily][:data][0]).to have_key(:temperatureLow)
  end
end
