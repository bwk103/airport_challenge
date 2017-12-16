require_relative 'plane'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def arrive(plane)
    fail 'Only planes can land at the airport' if !checkPlane(plane)
    @hangar.push(plane)
    plane.land
  end

  def depart(plane)
    plane.take_off
    @hangar.delete(plane)
  end

  def empty?
    @hangar.empty?
  end

  private

  def checkPlane(plane)
    return false if !plane.is_a? Plane
    true
  end

end
