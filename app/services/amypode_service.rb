class AmypodeService
  include Service
  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def antipode
    conn.get('')
    parse(reponse)
  end
end
