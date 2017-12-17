require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 20

  attr_reader :hangar, :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @hangar = []
  end

  def arrive(plane)
    fail 'Only planes can land at the airport' if !checkPlane(plane)
    fail 'The airport is currently at capacity' if atCapacity
    fail 'That plane is already at the airport' if checkHangar(plane)
    fail 'The airport is currently closed due to stormy weather' if stormy?
    @hangar.push(plane)
    plane.land
  end

  def depart(plane)
    fail 'That plane is not currently at the airport' if !checkHangar(plane)
    fail 'The airport is currently closed due to stormy weather' if stormy?
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

  def stormy?
    Kernel.rand(1..9) > 7
  end

  def atCapacity
    @hangar.count >= @capacity
  end

end
