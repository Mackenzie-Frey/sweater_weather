class FavoriteCitySerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :location,
              :current_weather
end
