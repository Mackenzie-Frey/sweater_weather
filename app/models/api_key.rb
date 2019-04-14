class ApiKey
  attr_reader :key

  def initialize
    @key = SecureRandom.hex(12)
  end
end
