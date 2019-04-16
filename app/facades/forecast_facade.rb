class ForecastFacade
  def initialize(location)
    @location = location
  end

  def forecast
    ForecastService.new(latitude, longitude).forecast
  end

  def location
    LocationService.new.location(@location)
  end

  def latitude
    location[0]
  end

  def longitude
    location[1]
  end
end
