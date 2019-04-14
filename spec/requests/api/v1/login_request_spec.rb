require 'rails_helper'

describe 'Login API - Sessions' do
  context 'for a registered user visiting the endpoint' do
    before :each do
      @email = 'email'
      @password = 'password123'
      @api_key = "jgn983hy48thw9begh98h4539h4"

      User.create!(email: @email, password: @password, password_confirmation: @password, api_key: @api_key)
    end

    it 'receives a post request and returns json response with an api_key' do
      user_credentials = {email: @email, password: @password}

      post '/api/v1/sessions', params: user_credentials

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(result[:data][:attributes][:api_key]).to eq(@api_key)
    end

    it 'receives an incorrect email address and returns a 401 error' do
      user_credentials = {email: 'incorrect@email.com', password: @password}

      post '/api/v1/sessions', params: user_credentials

      expect(response.status).to eq(401)
    end

    it 'receives an incorrect password and returns a 401 error' do
      user_credentials = {email: @email, password: 'incorrect_password'}

      post '/api/v1/sessions', params: user_credentials

      expect(response.status).to eq(401)
    end
  end
end
