class BackgroundService
  include Service
  def initialize(location)
    @location = location
  end

  def images
    # Unsplash::Photo.search(sanitize_location_params)[0]
    response = conn.get('/search/photos')
    parse(response)
  end

  def conn
    Faraday.new(url: 'https://api.unsplash.com') do |faraday|
      faraday.params['client_id'] = ENV['unsplash_client_id']
      faraday.params['query'] = sanitize_location_params
      faraday.adapter Faraday.default_adapter
    end
  end

  def sanitize_location_params
    @location.split(',')[0]
  end
end
