require 'rails_helper'

describe 'Antipode API' do
  it "receives the location and outputs that location, the anitpode & the antipode's forecast" do

    get `/api/v1/antipode?loc=hongkong`

    result = JSON.parse(response.body, symbolize_names: true)

    attributes = result[:data][:attributes]

    expect(response).to be_succesful
    expect(result[:data][:type]).to eq('antipode')
    expect(attributes).to be_a(Hash)
    expect(attributes).to have_key(:location_name)
    expect(attributes).to have_key(:forecast)
    expect(attributes[:forecast]).to have_key(:summary)
    expect(attributes[:forecast]).to have_key(:current_temperature)

    expect(result[:data]).to have_key(:search_location)
    expect(result[:data][:search_location]).to eq('Hong Kong')
  end
end


# An antipode is the point on the planet that is diametrically opposite.

# You will create an endpoint like so:, `/api/v1/antipode?loc=hongkong`
#
# You will use the `Amypode API` to determine the antipode for Hong Kong.
#
# [`http://amypode.herokuapp.com/api/v1/antipodes?lat=27&long=-82`]
#
# This is a sample request. Amypode API requires header based authentication. It expects the  `api_key` header to be set to your key, which is `oscar_the_grouch`
#
# Your endpoint will give the user the original city, and the antipode’s location name and its current weather summary and current temperature in a format like this:
#
# ```
# {
#     "data": [
#         {
#             "id": "1",
#             "type": "antipode",
#             "attributes": {
#                 "location_name": "Antipode City Name",
#                 "forecast": {
#                     "summary": "Mostly Cloudy,
#                     "current_temperature": "72",
#                 				},
#             "search_location": "Hong Kong"
#             }
#         }
#     ]
# }
# ```
