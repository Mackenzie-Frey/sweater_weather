require 'rails_helper'

describe 'Users API' do
  it 'recieves user info and returns an api key' do

    visitor_info = { "email": "whatever@example.com",
    "password": "password", "password_confirmation": "password" }

    post '/api/v1/users', params: visitor_info

    result = JSON.parse(response.body)

    expect(response).to have_status(200)
    expect(result).to be_a(Hash)
    expect(result['api_key']).to eq('jgn983hy48thw9begh98h4539h4')
  end
end
