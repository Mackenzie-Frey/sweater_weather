require 'rails_helper'

describe 'Favorite Location API', :vcr do
  before :each do
    @password = 'password123'
    @api_key = "jgn983hy48thw9begh98h4539h4"
    @city = "Denver, CO"

    @user1 = User.create!(email: 'email@email.com', password: @password, password_confirmation: @password, api_key: @api_key)
    @user2 = User.create!(email: 'different-email', password: @password, password_confirmation: @password, api_key: 'different-key')
  end

  context 'POST requests' do
    it "receives a location & API key, then saves the location as the user's favorite" do
      body = "{ \"location\": \"#{@city}\", \"api_key\": \"#{@api_key}\"}"

      post '/api/v1/favorites', params: body

      expect(response.status).to eq(204)
      expect(@user1.favorite_cities[0].city).to eq(@city)
      expect(@user2.favorite_cities).to eq([])
    end

    it "receives a location & an incorrect API key, and does not save the location as a user's favorite" do
      body = "{ \"location\": \"#{@city}\", \"api_key\": \"incorrect-key\"}"

      post '/api/v1/favorites', params: body

      expect(response.status).to eq(401)
      expect(@user1.favorite_cities).to eq([])
    end

    it "receives a location, but no API key, and does not save the location as a user's favorite" do
      body = "{ \"location\": \"#{@city}\"}"

      post '/api/v1/favorites', params: body

      expect(response.status).to eq(401)
      expect(@user1.favorite_cities).to eq([])
    end
  end

  context 'DELETE requests' do
    it 'receives a location and valid API key and outputs the city_forecast that was deleted' do
      body1 = "{ \"location\": \"#{@city}\", \"api_key\": \"#{@api_key}\"}"
      post '/api/v1/favorites', params: body1

      body2 = {"location": "Denver, CO", "api_key": "jgn983hy48thw9begh98h4539h4"}.to_json
      delete '/api/v1/favorites', params: body2

      result = JSON.parse(response.body, symbolize_names: true)

      attributes = result[0][:data][:attributes]

      expect(response.status).to eq(200)
      expect(attributes).to have_key(:id)
      expect(attributes[:location]).to eq(@city)
      expect(attributes[:current_weather]).to have_key(:current_time)
      expect(attributes[:current_weather]).to have_key(:current_summary)
      expect(attributes[:current_weather]).to have_key(:current_icon)
      expect(attributes[:current_weather]).to have_key(:current_temperature)
      expect(attributes[:current_weather]).to have_key(:current_humidity)
      expect(attributes[:current_weather]).to have_key(:current_visibility)
      expect(attributes[:current_weather]).to have_key(:current_uv_index)
      expect(attributes[:current_weather]).to have_key(:current_apparant_temperature)
    end

    it "receives a location & an incorrect API key, and does not delete the location from a user's favorite" do
      body1 = "{ \"location\": \"#{@city}\", \"api_key\": \"#{@api_key}\"}"
      post '/api/v1/favorites', params: body1

      body2 = {"location": "Denver, CO", "api_key": "incorrect-key"}.to_json
      delete '/api/v1/favorites', params: body2

      expect(response.status).to eq(401)
      expect(@user1.favorite_cities[0].city).to eq(@city)
    end

    it "receives a location, but no API key, and does not delete the location from a user's favorite" do
      body1 = "{ \"location\": \"#{@city}\", \"api_key\": \"#{@api_key}\"}"
      post '/api/v1/favorites', params: body1

      body2 = {"location": "Denver, CO"}.to_json
      delete '/api/v1/favorites', params: body2

      expect(response.status).to eq(401)
      expect(@user1.favorite_cities[0].city).to eq(@city)
    end
  end
end
