require 'rails_helper'

context 'Location Service' do
  it 'exists' do
    location = LocationService.new('denver,co')
    expect(location).to be_a(LocationService)
  end

  it 'when given city it returns a latitude & longtitude' do
    location = LocationService.new('denver,co')
    expect(location).to eq("some lat & long")
  end
end
