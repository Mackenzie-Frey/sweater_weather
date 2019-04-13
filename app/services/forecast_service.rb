class ForecastService
  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def forecast
    response = conn.get("/forecast/#{ENV['dark_sky_key']}/#{@lat},#{@long}")
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(url: 'https://api.darksky.net/') do |faraday|
      faraday.params['exclude'] = 'minutely'
      faraday.adapter Faraday.default_adapter
    end
  end
end
