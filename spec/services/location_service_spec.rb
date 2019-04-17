require 'rails_helper'

describe LocationService, :vcr do
  before :each do
    @city = 'denver,co'
    @lat = -22.3193039
    @long = -65.8306389
  end

  it 'exists' do
    location = LocationService.new

    expect(location).to be_a(LocationService)
  end

  it 'when given city it returns a latitude & longtitude' do
    coordinates = LocationService.new.location(@city)

    expect(coordinates).to eq([39.7392358, -104.990251])
  end

  it '#city -> receives a lat and long and returns a city' do
    city = LocationService.new.city(@lat, @long)

    expect(city).to eq('Jujuy, Argentina')
  end
end
