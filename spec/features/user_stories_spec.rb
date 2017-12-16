describe 'User Stories' do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }


  #As as air traffic controller
  #So I can get passengers to a destination
  #I want to instruct a plane to land at an airport.
  it "to allow passengers to arrive, planes can land at an airport" do
    allow(Kernel).to receive(:rand).and_return(1)
    expect{ airport.arrive(plane) }.not_to raise_error
  end

  #As an air traffic controller,
  #So I can get passengers on the way to their destination
  #I want to instruct a plane to take off from an airport
  it "to allow passengers to leave, planes can take off from an airport" do
    allow(Kernel).to receive(:rand).and_return(1)
    airport.arrive(plane)
    expect { airport.depart(plane) }.not_to raise_error
  end

  #As an air traffic controller,
  #So I can get passengers on the way to their destination
  #I want to see confirmation that a plane has departed.
  it "to assist ATC, planes can confirm their departure" do
    allow(Kernel).to receive(:rand).and_return(1)
    expect(plane).not_to be_landed
  end

  #As an air traffic controller
  #To ensure safety
  #I want to prevent landing when weather is stormy
  it "to ensure safety, planes cannot land during storms" do
    allow(Kernel).to receive(:rand).and_return(9)
    expect { airport.arrive(plane) }.to raise_error 'The airport is currently closed due to stormy weather'
  end

end
