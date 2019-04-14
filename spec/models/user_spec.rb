require 'rails_helper'

describe User, type: :model do
  it 'exists' do
    user = User.new( email: 'email', password: 'password123', password_confirmation: 'password123' )

    expect(user).to be_a(User)
  end

  context 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:api_key) }
  end
end
