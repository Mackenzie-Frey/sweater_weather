require 'rails_helper'

describe ApiKey, type: :model do
  it 'exists' do
    api_key = ApiKey.new

    expect(api_key).to be_a(ApiKey)
  end

  it 'has a key attribute' do
    key = ApiKey.new.key

    expect(key).to be_a(String)
    expect(key.length).to eq(24)
  end
end
