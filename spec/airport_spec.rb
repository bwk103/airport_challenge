require 'airport'

describe Airport do

    subject(:airport) { Airport.new }

  describe "#land" do

    it "adds a plane to the hangar" do
      plane = double('plane')
      airport.land(plane)
      expect(airport).not_to be_empty
    end
  end

  describe "#take_off" do
    let(:plane) { double :plane }

    before(:each) do
      airport.land(plane)
    end

    it "returns a plane" do
      departed_plane = airport.take_off(plane)
      expect(departed_plane).to eq(plane)
    end

    it "removes the plane from the hangar" do
      airport.take_off(plane)
      expect(airport).to be_empty
    end
  end

end
