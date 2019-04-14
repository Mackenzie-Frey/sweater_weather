require 'rails_helper'

desribe 'Favorite Location API' do
  before :each do
    @email = 'email'
    @password = 'password123'
    @api_key = "jgn983hy48thw9begh98h4539h4"

    User.create!(email: @email, password: @password, password_confirmation: @password, api_key: @api_key)
  end

  it "receives a location & API key, then saves the location as the user's favorite" do
    favorite_params = {"location": "Denver, CO",
                        "api_key": @api_key}

    post '/api/v1/favorites', params: favorite_params

    expect(response.status).to eq(200)
    expect(response.status).to eq(200)
  end

  it "receives a location & an incorrect API key, and does not save the location as a user's favorite" do
    favorite_params = {"location": "Denver, CO",
                        "api_key": "incorrect-key"}

    post '/api/v1/favorites', params: favorite_params

    expect(response.status).to eq(401)
  end

  it "receives a location, but no API key, and does not save the location as a user's favorite" do
    favorite_params = {"location": "Denver, CO"}

    post '/api/v1/favorites', params: favorite_params

    expect(response.status).to eq(401)
  end
end
