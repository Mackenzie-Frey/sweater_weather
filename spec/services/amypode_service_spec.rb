require 'rails_helper'

describe AmypodeService do
  before :each do
    @lat = 27
    @long = -82
  end

  it 'exists' do
    amypode_service = AmypodeService.new

    expect(amypode_service).to be_a(AmypodeService)
  end


  it '#antipode -> receives lat and long and returns the antipode' do
    response = {:data=>{:id=>'1', :type=>'antipode', :attributes=>{:lat=>-27.0, :long=>98.0}}}

    antipode = AmypodeService.new.antipode([@lat, @long])

    expect(antipode).to eq(response)
  end
end
