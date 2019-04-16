require 'rails_helper'

describe FavoriteCityForecast, type: :model do
  before :each do
    @lat = 39.7392358
    @long = -104.990251
    @city = "Denver, CO"
    city_forecast = [@city, ForecastService.new(@lat, @long).forecast]
    @fav_city_forecast = FavoriteCityForecast.new(city_forecast)
  end

  it 'exists' do
    expect(@fav_city_forecast).to be_a(FavoriteCityForecast)
  end

  it '#id' do
    expect(@fav_city_forecast.id).to be_a(String)
  end

  it '#lat' do
    expect(@fav_city_forecast.lat).to eq(@lat)
  end

  it '#long' do
    expect(@fav_city_forecast.long).to eq(@long)
  end

  it '#location' do
    expect(@fav_city_forecast.location).to eq(@city)
  end

  it '#currently' do
    expect(@fav_city_forecast.currently).to be_a(Hash)
    expect(@fav_city_forecast.currently).to have_key(:time)
    expect(@fav_city_forecast.currently).to have_key(:summary)
    expect(@fav_city_forecast.currently).to have_key(:icon)
    expect(@fav_city_forecast.currently).to have_key(:precipProbability)
    expect(@fav_city_forecast.currently).to have_key(:temperature)
    expect(@fav_city_forecast.currently).to have_key(:apparentTemperature)
    expect(@fav_city_forecast.currently).to have_key(:humidity)
    expect(@fav_city_forecast.currently).to have_key(:uvIndex)
    expect(@fav_city_forecast.currently).to have_key(:visibility)
  end

  it '#current_weather' do

    expect(@fav_city_forecast.current_weather).to be_a(Hash)
  end
end
