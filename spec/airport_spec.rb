require 'airport'

describe Airport do

    subject(:airport) { Airport.new }

  describe "#arrive" do
    let(:plane) { instance_double('plane', :land => nil, :is_a? => true, :take_off => nil) }

    before(:each) do
      allow(Kernel).to receive(:rand).and_return(1)
    end

    it "adds a plane to the hangar" do
      airport.arrive(plane)
      expect(airport).not_to be_empty
    end

    it "calls the plane's land method" do
      expect(plane).to receive :land
      airport.arrive(plane)
    end

    it "raises an error if a non-plane is passed as a parameter" do
      car = double('car', :land => nil, :is_a? => false)
      expect { airport.arrive(car) }.to raise_error 'Only planes can land at the airport'
    end

    it "raises an error if the plane is already at the airport" do
      airport.arrive(plane)
      expect { airport.arrive(plane) }.to raise_error 'That plane is already at the airport'
    end

    it "raises an error if the airport is already at capacity" do
      20.times { airport.arrive(Plane.new) }
      expect { airport.arrive(plane) }.to raise_error 'The airport is currently at capacity'
    end

    context "when the weather is stormy" do
      it "raises an error if the airport is closed" do
        allow(Kernel).to receive(:rand).and_return(9)
        expect { airport.arrive(plane) }.to raise_error 'The airport is currently closed due to stormy weather'
      end
    end

  end

  describe "#capacity" do
    it "by default is 20 planes" do
      expect(airport.capacity).to be(20)
    end

    it "can be changed by the user passing a parameter to the constructor" do
      airport2 = Airport.new(50)
      expect(airport2.capacity).to be 50
    end

  end

  describe "#depart" do

    let(:plane) { instance_double('plane', :land => nil, :take_off => nil, :is_a? => true) }


    context "when the plane is in the hangar" do

      before(:each) do
        allow(Kernel).to receive(:rand).and_return(1)
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
        plane = instance_double('plane', :land => nil, :is_a? => true)
        airport.arrive(plane)
        expect(plane).to receive :take_off
        airport.depart(plane)
      end
    end

    context "when the weather is stormy" do

      it "throws an error if the airport is closed due to stormy weather" do
        allow(Kernel).to receive(:rand).and_return(1, 9)
        airport.arrive(plane)
        expect { airport.depart(plane) }.to raise_error 'The airport is currently closed due to stormy weather'
      end
    end

  end

    context "when the plane is not in the hangar" do

      it "throws an error" do
        plane = instance_double('plane', :land => nil, :take_off => nil, :is_a? => true)
        expect { airport.depart(plane) }.to raise_error 'That plane is not currently at the airport'
      end
    end

end
