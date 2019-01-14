require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end


# Put your variables here~!
bob = Passenger.new("Bob")
driver_Gary = Driver.new("driver_Gary")
ride = Ride.new(driver_Gary, bob, 75.0)
driver_Linda = Driver.new("driver_Linda")
ride = Ride.new(driver_Linda, bob, 26.0)
sam = Passenger.new("Sam")
ride = Ride.new(driver_Gary, sam, 125.0)

binding.pry
