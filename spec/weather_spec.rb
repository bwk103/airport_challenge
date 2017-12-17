require 'weather'

describe Weather do

  subject(:weather) { Weather.new }

  describe "#stormy" do
    it "can set the weather to be stormy" do
      allow(Kernel).to receive(:rand).and_return(9)
      expect(weather.stormy?).to be true
    end

    it "can set the weather to not be stormy" do
      allow(Kernel).to receive(:rand).and_return(1)
      expect(weather.stormy?).to be false
    end
  end

end
