require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  describe "#land" do
    it "changes @landed to true" do
      plane.land
      expect(plane).to be_landed
    end
  end

  describe "#take_off" do
    it "changes @landed to false" do
      plane.take_off
      expect(plane).not_to be_landed
    end
  end

end
