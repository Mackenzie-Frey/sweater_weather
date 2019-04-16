require 'rails_helper'

describe 'Favorite Location API' do
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
    end

    it "receives a location, but no API key, and does not save the location as a user's favorite" do
      body = "{ \"location\": \"#{@city}\"}"

      post '/api/v1/favorites', params: body

      expect(response.status).to eq(401)
    end
  end
end
