class Background
  def initialize(background_data)
    @background_data = background_data[:results][0]
  end

  def id
    @background_data[:id]
  end

  def url
    @background_data[:urls][:raw]
  end
end
