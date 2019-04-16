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
    currently = @fav_city_forecast.currently

    expect(currently).to be_a(Hash)
    expect(currently).to have_key(:time)
    expect(currently).to have_key(:summary)
    expect(currently).to have_key(:icon)
    expect(currently).to have_key(:precipProbability)
    expect(currently).to have_key(:temperature)
    expect(currently).to have_key(:apparentTemperature)
    expect(currently).to have_key(:humidity)
    expect(currently).to have_key(:uvIndex)
    expect(currently).to have_key(:visibility)
  end

  xit '#current_weather' do
    binding.pry
    current_weather = @fav_city_forecast.current_weather
    expect(current_weather).to be_a(Hash)
    expect(current_weather.keys.count).to eq(8)
    expect(current_weather).to have_key()
    {:current_time=>1555428313,
 :current_summary=>"Partly Cloudy",
 :current_icon=>"partly-cloudy-day",
 :current_temperature=>50.27,
 :current_humidity=>0.61,
 :current_visibility=>5.66,
 :current_uv_index=>3,
 :current_apparant_temperature=>50.27}
  end
end
