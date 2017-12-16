describe 'User Stories' do

  let(:airport) { Airport.new }
  let(:plane) { Plane.new }


  #As as air traffic controller
  #So I can get passengers to a destination
  #I want to instruct a plane to land at an airport.
  it "to allow passengers to arrive, planes can land at an airport" do
    expect{ airport.arrive(plane) }.not_to raise_error
  end


end
