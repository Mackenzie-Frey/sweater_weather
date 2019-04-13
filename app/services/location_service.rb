class LocationService
  attr_reader :lat,
              :long

  def initialize(location)
    @location = location
  end

  def location
    response = conn.get('/maps/api/geocode/json')
    parse(response)
  end

  def parse(response)
    result = JSON.parse(response.body, symbolize_names: true)
    # stop here
    coordinates(result)
    result
  end

  def coordinates(result)
    coords = result[:results][0][:geometry][:location]
    @lat = coords[:lat]
    @long = coords[:lng]
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params[:key] = ENV['google_maps_key']
      faraday.params[:address] = @location
      faraday.adapter  Faraday.default_adapter
    end
  end
end
