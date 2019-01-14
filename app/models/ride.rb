class Ride

  attr_accessor :driver, :passenger, :float_distance
  @@rides = []

  def initialize(driver, passenger, float_distance)
    @driver = driver
    @passenger = passenger
    @float_distance = float_distance
    @@rides << self
  end

  def self.all
    @@rides
  end

  def self.average_distance
    sum = 0.0
    self.all.each do |ele|
        sum += ele.float_distance
    end
    avg = sum / self.all.length
    avg
  end

end
