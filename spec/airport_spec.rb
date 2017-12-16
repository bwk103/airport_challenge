require 'airport'

describe Airport do

    subject(:airport) { Airport.new }

  describe "#arrive" do

    it "adds a plane to the hangar" do
      plane = double('plane', :land => nil, :is_a? => true )
      airport.arrive(plane)
      expect(airport).not_to be_empty
    end

    it "calls the plane's land method" do
      plane = double('plane', :is_a? => true)
      expect(plane).to receive :land
      airport.arrive(plane)
    end

    it "raises an error if a non-plane is passed as a parameter" do
      car = double('car', :land => nil, :is_a? => false)
      expect { airport.arrive(car) }.to raise_error 'Only planes can land at the airport'
    end

    it "raises an error if the plane is already at the airport" do
      plane = double('plane', :land => nil, :is_a? => true )
      airport.arrive(plane)
      expect { airport.arrive(plane) }.to raise_error 'That plane is already at the airport'
    end

  end

  describe "#depart" do

    context "when the plane is in the hangar" do

      let(:plane) { double('plane', :land => nil, :take_off => nil, :is_a? => true) }
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
        plane = double('plane', :land => nil, :is_a? => true)
        airport.arrive(plane)
        expect(plane).to receive :take_off
        airport.depart(plane)
      end

    end

    context "when the plane is not in the hangar" do

      it "throws an error" do
        plane = double('plane', :land => nil, :take_off => nil, :is_a? => true)
        expect { airport.depart(plane) }.to raise_error 'That plane is not currently at the airport'
      end
    end

  end

end
