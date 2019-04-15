require 'rails_helper'

describe LocationService do
  it 'exists' do
    location = LocationService.new('denver,co', nil, nil)

    expect(location).to be_a(LocationService)
  end

  it 'when given city it returns a latitude & longtitude' do
    lat = LocationService.new('denver,co', nil, nil).lat
    long = LocationService.new('denver,co', nil, nil).long

    expect(lat).to eq(39.7392358)
    expect(long).to eq(-104.990251)
  end
end
