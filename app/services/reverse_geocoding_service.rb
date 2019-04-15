class ReverseGeocodingService
  include Service

  def initialize(lat, long)
    @lat = lat
    @long = long
  end

# go back and make city object for the parsed response (result)
  def city
    response = conn.get('/maps/api/geocode/json')
    result = parse(response)
    parse_city(result)
  end

  def parse_city(result)
    result[:results][1][:formatted_address]
  end

  def location_params
    @lat.to_s + ',' + @long.to_s
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params[:key] = ENV['google_maps_key']
      faraday.params[:latlng] = location_params
      faraday.adapter  Faraday.default_adapter
    end
  end
end
