require_relative 'plane'

class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def arrive(plane)
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

end
