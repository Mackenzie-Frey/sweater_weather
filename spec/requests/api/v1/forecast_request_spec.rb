require 'rails_helper'

context '/api/v1/forecast?location=denver,co' do
  it 'outputs weather data for a specific location' do

    get '/api/v1/forecast?location=denver,co'

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful


    current_weather = result[:data][:attributes]

    expect(current_weather).to have_key(:current_time)
    expect(current_weather).to have_key(:current_summary)
    expect(current_weather).to have_key(:current_icon)
    expect(current_weather).to have_key(:current_temperature)
    expect(current_weather).to have_key(:current_humidity)
    expect(current_weather).to have_key(:current_visibility)
    expect(current_weather).to have_key(:current_uv_index)
    expect(current_weather).to have_key(:current_apparant_temperature)


    hourly_weather = result[:data][:attributes][:hourly_weather]

    expect(hourly_weather[0]).to have_key(:time)
    expect(hourly_weather[0]).to have_key(:summary)
    expect(hourly_weather[0]).to have_key(:icon)
    expect(hourly_weather[0]).to have_key(:precipProbability)
    expect(hourly_weather[0]).to have_key(:temperature)
    expect(hourly_weather[0]).to have_key(:apparentTemperature)
    expect(hourly_weather[0]).to have_key(:humidity)
    expect(hourly_weather[0]).to_not eq(hourly_weather[3])


    expect(result[:data][:attributes]).to have_key(:daily_summary)

    daily_weather = result[:data][:attributes][:daily_weather]

    expect(daily_weather[0]).to have_key(:time)
    expect(daily_weather[0]).to have_key(:icon)
    expect(daily_weather[0]).to have_key(:precipProbability)
    expect(daily_weather[0]).to have_key(:precipType)
    expect(daily_weather[0]).to have_key(:temperatureHigh)
    expect(daily_weather[0]).to have_key(:temperatureLow)
    expect(daily_weather[0]).to_not eq(daily_weather[3])
  end
end
