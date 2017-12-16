class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    @hangar.push(plane)
  end

  def take_off(plane)
    @hangar.pop
  end

  def empty?
    @hangar.empty?
  end

end
