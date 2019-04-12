require 'rails_helper'

context '/api/v1/forecast?location=denver,co' do
  it 'outputs weather data for a specific location' do

    get '/api/v1/forecast?location=denver,co'

    expected_data = "thing"

    result = JSON.parse(response.body)

    expect(result).to eq(expected_data)
  end
end
