class WaterQualityResults
  attr_reader :descriptor, :address

  @@all =[]

  def initialize(descriptor, address)
    @descriptor = descriptor
    @address = address
    @@all << self
  end

  def self.all
      @@all
  end

end
