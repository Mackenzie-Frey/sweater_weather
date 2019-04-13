require 'rails_helper'

context 'Background Image Request' do
  it 'returns an image url' do

    get '/api/v1/backgrounds?location=denver,co'

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(result).to eq("thing")
  end
end
