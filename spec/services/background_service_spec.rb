require 'rails_helper'

context 'Background Service' do
  before :each do
    @background = BackgroundService.new('denver,co')
  end

  it 'exists' do
    expect(@background).to be_a(BackgroundService)
  end

  it 'outputs a background image object' do
    photo = 'https://images.unsplash.com/photo-1546156929-a4c0ac411f47?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjY2NTE1fQ'
    background_data = @background.images

    expect(background_data).to be_a(Hash)
    expect(background_data[:results][0][:id]).to be_a(String)
    expect(background_data[:results][0][:urls][:raw]).to eq(photo)
  end
end
