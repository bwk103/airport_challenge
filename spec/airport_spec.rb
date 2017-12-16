require 'airport'

describe Airport do

    subject(:airport) { Airport.new }

  describe "#arrive" do

    it "adds a plane to the hangar" do
      plane = double('plane', :land => nil)
      airport.arrive(plane)
      expect(airport).not_to be_empty
    end

    it "calls the plane's land method" do
      plane = double('plane')
      expect(plane).to receive :land
      airport.arrive(plane)
    end
  end

  describe "#depart" do
    let(:plane) { double('plane', :land => nil, :take_off => nil) }

    before(:each) do
      airport.arrive(plane)
    end

    it "returns a plane" do
      departed_plane = airport.depart(plane)
      expect(departed_plane).to be(plane)
    end

    it "removes the plane from the hangar" do
      airport.depart(plane)
      expect(airport).to be_empty
    end

    it "calls the plane's depart method" do
      plane = double(plane)
      expect(plane).to receive :take_off
      airport.depart(plane)
    end
  end

end
