require 'rails_helper'

describe 'Background', :vcr, type: :model do
  before :each do
    background_data = BackgroundService.new('denver,co').images
    @background = Background.new(background_data)
  end

  it 'exists' do
    expect(@background).to be_a(Background)
  end

  it 'has attributes' do
    expect(@background.id).to be_a(String)
    expect(@background.url).to be_a(String)
  end
end
