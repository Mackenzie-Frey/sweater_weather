require 'rails_helper'

describe AmypodeService do
  before :each do
    @lat = 27
    @long = -82
  end

  it 'exists' do
    amypode_service = AmypodeService.new(@lat, @long)

    expect(amypode_service).to be_a(AmypodeService)
  end


  it '#antipode -> receives lat and long and returns the antipode' do
    response = {:data=>{:id=>'1', :type=>'antipode', :attributes=>{:lat=>-27.0, :long=>98.0}}}

    antipode = AmypodeService.new(@lat, @long).antipode

    expect(antipode).to eq(response)
  end

  it '#antipode -> receives lat and long and returns the antipode lat & long' do
    lat = AmypodeService.new(@lat, @long).antipode_lat
    long = AmypodeService.new(@lat, @long).antipode_long

    expect(lat).to eq(-27.0)
    expect(long).to eq(98.0)
  end
end
