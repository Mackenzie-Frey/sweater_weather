class AmypodeService
  include Service

  def antipode(coordinates)
    response = conn.get("/api/v1/antipodes?lat=#{coordinates[0]}&long=#{coordinates[1]}")
    parse(response)
  end

  def antipode_lat
    antipode[:data][:attributes][:lat]
  end

  def antipode_long
    antipode[:data][:attributes][:long]
  end

  def conn
    Faraday.new(url: 'http://amypode.herokuapp.com') do |faraday|
      faraday.headers['api_key'] = ENV['amypode_key']
      faraday.adapter Faraday.default_adapter
    end
  end
end
