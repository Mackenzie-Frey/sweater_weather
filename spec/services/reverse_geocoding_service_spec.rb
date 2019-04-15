require 'rails_helper'

describe ReverseGeocodingService do
  before :each do
    @antipode_lat = -22.3193039
    @antipode_long = -65.8306389
  end

  it 'exists' do
    reverse_geocoding_service = ReverseGeocodingService.new(@antipode_lat, @antipode_long)

    expect(reverse_geocoding_service).to be_a(ReverseGeocodingService)
  end

  it '#city -> receives a lat and long and returns a city' do
    city = ReverseGeocodingService.new(@antipode_lat, @antipode_long).city

    expect(city).to eq("Something like La Paz")
  end
end
