require 'rails_helper'

describe LocationService do
  before :each do
    @city = 'denver,co'
    @lat = -22.3193039
    @long = -65.8306389
  end

  it 'exists' do
    location = LocationService.new(@city, @lat, @long)

    expect(location).to be_a(LocationService)
  end

  it 'when given city it returns a latitude & longtitude' do
    lat = LocationService.new(@city, nil, nil).lat
    long = LocationService.new(@city, nil, nil).long

    expect(lat).to eq(39.7392358)
    expect(long).to eq(-104.990251)
  end

  it '#city -> receives a lat and long and returns a city' do
    city = LocationService.new(nil, @lat, @long).city

    expect(city).to eq('Jujuy, Argentina')
  end
end
