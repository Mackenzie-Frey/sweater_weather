class LocationService
  include Service

  def initialize(location = nil, lat = nil, long = nil)
    @location = location
    @lat = lat
    @long = long
  end

  def location
    response = conn.get("/maps/api/geocode/json?address=#{@location}")
    parse(response)
  end

  def coordinates
    location[:results][0][:geometry][:location]
  end

  def lat
    coordinates[:lat]
  end

  def long
    coordinates[:lng]
  end

  def city
    response = conn.get("/maps/api/geocode/json?latlng=#{location_params}")
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
      faraday.adapter  Faraday.default_adapter
    end
  end
end
