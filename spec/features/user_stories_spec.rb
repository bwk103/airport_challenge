describe 'User Stories' do

  let(:airport) { Airport.new(20, weather) }
  let(:plane) { Plane.new }
  let(:weather) { Weather.new }


  #As as air traffic controller
  #So I can get passengers to a destination
  #I want to instruct a plane to land at an airport.
  it "to allow passengers to arrive, planes can land at an airport" do
    allow(weather).to receive(:stormy?).and_return(false)
    expect{ airport.arrive(plane) }.not_to raise_error
  end

  #As an air traffic controller,
  #So I can get passengers on the way to their destination
  #I want to instruct a plane to take off from an airport
  it "to allow passengers to leave, planes can take off from an airport" do
    allow(weather).to receive(:stormy?).and_return(false)
    airport.arrive(plane)
    expect { airport.depart(plane) }.not_to raise_error
  end

  #As an air traffic controller,
  #So I can get passengers on the way to their destination
  #I want to see confirmation that a plane has departed.
  it "to assist ATC, planes can confirm their departure" do
    allow(weather).to receive(:stormy?).and_return(false)
    expect(plane).not_to be_landed
  end

  #As an air traffic controller
  #To ensure safety
  #I want to prevent landing when weather is stormy.
  it "to ensure safety, planes cannot land during storms" do
    allow(weather).to receive(:stormy?).and_return(true)
    expect { airport.arrive(plane) }.to raise_error 'The airport is currently closed due to stormy weather'
  end

  #As an air traffic controller
  #To ensure safety
  #I want to prevent takeoff when the weather is stormy.
  it "to ensure safety, planes cannot takeoff during storms" do
    allow(weather).to receive(:stormy?).and_return(false, true)
    airport.arrive(plane)
    expect { airport.depart(plane) }.to raise_error 'The airport is currently closed due to stormy weather'
  end

  #As an air traffic controller
  #To ensure safety
  #I want to prevent landing when the airport is full.
  it "for safety reasons, prevents landing when the airport is at capacity" do
    allow(weather).to receive(:stormy?).and_return(false)
    20.times { airport.arrive(Plane.new) }
    expect { airport.arrive(plane) }.to raise_error 'The airport is currently at capacity'
  end

  #As a system designer
  #So that the software can be used for many different airports
  #I would like a default airport capacity that can be overridden as appropriate.
  it "so the system can be reused, capacity can be specified by the user" do
    airport2 = Airport.new(10, weather)
    expect(airport2.capacity).to be(10)
  end

  #Bonus - Write an rspec feature test that lands and takes off a number of planes
  it "to show the system works, multiple planes can land" do
    allow(weather).to receive(:stormy?).and_return(false)
    expect { 10.times { airport.arrive(Plane.new) } }.not_to raise_error
  end
end
