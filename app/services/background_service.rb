class BackgroundService
  def initialize(location)
    @location = location
  end

  def images
    Unsplash::Photo.search(sanitize_location_params)[0]
  end

  def sanitize_location_params
    @location.split(',')[0]
  end
end
