class Passenger

attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rides
    Ride.all.select do |obj|
      obj.passenger == self
    end
  end

  def drivers
    drivers_arr = []
    self.rides.each do |obj|
        drivers_arr << obj.driver.name
    end
    drivers_arr
  end

  def total_distance
    total = 0
    self.rides.each do |obj|
      total += obj.float_distance
    end
    total
  end

  def self.all
    passengers_arr = []
    Ride.all.each do |obj|
      passengers_arr << obj.passenger
    end
    passengers_arr.uniq
  end

  # def self.individual_avg_distance
  # end

  def self.premium_members
    #find the distance of each member.
    hash = {}
    Ride.all.each do |obj|
      if hash[obj.passenger]
        hash[obj.passenger] += obj.float_distance
      else
        hash[obj.passenger] = obj.float_distance
      end
    end
    premium_members = []
    hash.each do |name, distance|
      if distance > 100.0
        premium_members << name
      end
    end
    premium_members

  end


end
