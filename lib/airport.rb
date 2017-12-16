class Airport

  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def arrive(plane)
    @hangar.push(plane)
  end

  def depart(plane)
    @hangar.pop
  end

  def empty?
    @hangar.empty?
  end

end
