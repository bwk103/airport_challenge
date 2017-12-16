require_relative 'plane'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def arrive(plane)
    fail 'Only planes can land at the airport' if !checkPlane(plane)
    fail 'That plane is already at the airport' if checkHangar(plane)
    @hangar.push(plane)
    plane.land
  end

  def depart(plane)
    fail 'That plane is not currently at the airport' if !checkHangar(plane)
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

  def checkHangar(plane)
    @hangar.include?(plane)
  end

end
