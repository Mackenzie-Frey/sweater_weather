require 'rails_helper'

context 'Background Service' do
  before :each do
    @background = BackgroundService.new('denver,co')
  end

  it 'exists' do
    expect(@background).to be_a(BackgroundService)
  end

  it 'outputs a background image url' do
    photo = 'https://images.unsplash.com/photo-1546156929-a4c0ac411f47?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjY2NTE1fQ'

    expect(@background.url).to be_a(String)
    expect(@background.url).to eq(photo)
  end
end
