require 'rails_helper'

describe 'Users API' do
  it 'recieves user info, creates a user, and returns an api key' do
    email = 'email'
    password = 'password123'

    visitor_info = { "email": email,
                    "password": password, "password_confirmation": password }

    post '/api/v1/users', params: visitor_info

    result = JSON.parse(response.body)

    expect(User.last.email).to eq(email)
    expect(User.last.api_key).to be_a(String)
    expect(User.last.api_key.length).to eq(24)

    expect(response.status).to eq(201)
    expect(result).to be_a(Hash)
    expect(result['data']['attributes']['api_key']).to be_a(String)
    expect(result['data']['attributes']['api_key'].length).to eq(24)
  end

  it 'receives user info & does not create a user if passwords do not match' do
    visitor_info = { "email": "whatever@example.com",
                    "password": "password",
                    "password_confirmation": "password-not-matching" }

    post '/api/v1/users', params: visitor_info

    expect(response.status).to eq(400)
  end
end
