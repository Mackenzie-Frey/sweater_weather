class LocationService
  include Service

  def initialize(location)
    @location = location
  end

  def location
    response = conn.get('/maps/api/geocode/json')
    parse(response)
  end

  def lat
    location[:results][0][:geometry][:location][:lat]
  end

  def long
    location[:results][0][:geometry][:location][:lng]
  end

  def conn
    Faraday.new(url: 'https://maps.googleapis.com') do |faraday|
      faraday.params[:key] = ENV['google_maps_key']
      faraday.params[:address] = @location
      faraday.adapter  Faraday.default_adapter
    end
  end
end
