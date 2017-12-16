require 'airport'

describe Airport do

    subject(:airport) { Airport.new }

  describe "#arrive" do

    it "adds a plane to the hangar" do
      plane = double('plane')
      airport.arrive(plane)
      expect(airport).not_to be_empty
    end
  end

  describe "#depart" do
    let(:plane) { double :plane }

    before(:each) do
      airport.arrive(plane)
    end

    it "returns a plane" do
      departed_plane = airport.depart(plane)
      expect(departed_plane).to eq(plane)
    end

    it "removes the plane from the hangar" do
      airport.depart(plane)
      expect(airport).to be_empty
    end
  end

end
