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
    antipode = AmypodeService.new(@lat, @long).antipode

    expect(antipode).to eq('Some Antipode City Name')
  end
end
