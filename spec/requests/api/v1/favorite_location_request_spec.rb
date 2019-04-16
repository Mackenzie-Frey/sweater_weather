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

  context 'GET requests' do
    xit "receives an api key and returns the weather for the user's favorite cities" do
      city2 = "Seattle"

      body = "{ \"location\": \"#{@city}\", \"api_key\": \"#{@api_key}\"}"
      post '/api/v1/favorites', params: body

      body2 = "{ \"location\": \"#{city2}\", \"api_key\": \"#{@api_key}\"}"
      post '/api/v1/favorites', params: body2

      # body_with_key = "{ \"api_key\": \"#{@api_key}\"}"
      body_with_key = "{\"api_key\": \"jgn983hy48thw9begh98h4539h4\"}"
      get '/api/v1/favorites', params: body_with_key

      result = JSON.parse(response.body, symbolize_names: true)

#integrate FAST JSON
      expect(response.status).to eq(200)
      expect(result[0][:location]).to eq(@city)
      expect(result[0]).to have_key(:current_weather)

      current_weather = result[:data][:attributes]

      expect(current_weather).to have_key(:current_time)
      expect(current_weather).to have_key(:current_summary)
      expect(current_weather).to have_key(:current_icon)
      expect(current_weather).to have_key(:current_temperature)
      expect(current_weather).to have_key(:current_humidity)
      expect(current_weather).to have_key(:current_visibility)
      expect(current_weather).to have_key(:current_uv_index)
      expect(current_weather).to have_key(:current_apparant_temperature)

      expect(result[1][:location]).to eq(city2)
      expect(result[1]).to have_key(:current_weather)

      #copy the above for current weather and do for the index of 1 of result

    end
  end
end

# how to serialize an array of objects
# how to send a get request with a body in RSpec

# More testing (sad path and model)
# -------------------------------------------------
# grab from line 24 and 32
# do all of this but give a bad api key expect 401
# do all of this but give no api key expect 401
# Model test for Favorite Cities model
