require 'airport'

describe Airport do

    subject(:airport) { Airport.new }

  describe "#land" do

    it "adds a plane to the collection" do
      plane = double('plane')
      airport.land(plane)
      expect(airport).not_to be_empty
    end

  end

end
