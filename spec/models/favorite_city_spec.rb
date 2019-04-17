require 'rails_helper'

describe FavoriteCity, :vcr, type: :model do
  context 'Validations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:city) }
  end

  context 'Relationships' do
    it { should belong_to(:user) }
  end

  it 'exists & has attributes' do
    email = 'email'
    password = 'password123'
    api_key = "jgn983hy48thw9begh98h4539h4"

    user = User.create!(email: email, password: password, password_confirmation: password, api_key: api_key)

    city = "Denver, CO"
    favorite = FavoriteCity.create(user: user, city: city)

    expect(favorite).to be_a(FavoriteCity)
    expect(user.favorite_cities[0].city).to eq(city)
  end
end
