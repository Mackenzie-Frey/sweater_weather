class LocationService
  include Service

  def location(location)
    Rails.cache.fetch(location + 'location_service') do
      response = conn.get("/maps/api/geocode/json?address=#{location}")
      coordinates = parse(response)[:results][0][:geometry][:location]
      [ coordinates[:lat], coordinates[:lng] ]
    end
  end

  def city(lat, long)
    Rails.cache.fetch(location_params(lat,long) + 'location_service') do
      response = conn.get("/maps/api/geocode/json?latlng=#{location_params(lat,long)}")
      result = parse(response)
      parse_city(result)
    end
  end

  def parse_city(result)
    result[:results][1][:formatted_address]
  end

  def location_params(lat, long)
    lat.to_s + ',' + long.to_s
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params[:key] = ENV['google_maps_key']
      faraday.adapter  Faraday.default_adapter
    end
  end
end
