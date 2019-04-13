class ForecastFacade
  def initialize(location)
    @location = location
  end

  def forecast
    ForecastService.new(latitude, longitude).forecast
  end

  def latitude
    LocationService.new(@location).lat
  end

  def longitude
    LocationService.new(@location).long
  end
end
