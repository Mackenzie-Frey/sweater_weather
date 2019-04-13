class LocationService
  def initialize(location)
    @location = location
  end

  def lat
  end

  def long
  end

  def location
    response = conn.get('/maps/api/geocode/json')
    parse(response)
  end

  def parse
    binding.pry

  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params[:key] = ENV['google_maps_key']
      faraday.params[:address] = @location
      faraday.adapter  Faraday.default_adapter
    end
  end
end
