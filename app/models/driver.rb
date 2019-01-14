class Driver

  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def passenger_names
    passengers = []
    Ride.all.each do |obj|
      if obj.driver == self
        passengers << obj.passenger.name
      end
    end
    passengers.uniq
  end

  def rides
    Ride.all.select do |obj|
      obj.driver == self
    end
  end

  def self.all
    drivers = []
    Ride.all.each do |obj|
      drivers << obj.driver
    end
    drivers
  end

  def self.mileage_cap(float_distance)
    hash = {}
    Ride.all.each do |obj|
      if hash[obj.driver]
        hash[obj.driver] += obj.float_distance
      else
        hash[obj.driver] = obj.float_distance
      end
    end
    driven_over = []
    hash.each do |name, distance|
      if distance > float_distance
        driven_over << name
      end
    end
    driven_over

  end

end
