require 'rails_helper'

describe 'Antipode API', :vcr do
  it "receives the location and outputs that location, the anitpode & the antipode's forecast" do

    get '/api/v1/antipode?loc=hongkong'

    result = JSON.parse(response.body, symbolize_names: true)

    attributes = result[:data][:attributes]

    expect(response).to be_successful
    expect(result[:data][:type]).to eq('antipode')
    expect(attributes).to be_a(Hash)
    expect(attributes).to have_key(:location_name)
    expect(attributes).to have_key(:forecast)
    expect(attributes[:forecast]).to have_key(:summary)
    expect(attributes[:forecast]).to have_key(:current_temperature)

    expect(attributes).to have_key(:search_location)
    expect(attributes[:search_location]).to eq('hongkong')
  end
end
