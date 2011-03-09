require 'spec_helper'

module Kosher
  describe Availability do
    before do
      @availability = Availability.new
    end

    describe "#kosher?" do
      before do
        @availability.threshold = 48
      end

      context "when available within threshold" do
        it "returns true" do
          @availability.hours = 48
          @availability.should be_kosher
        end
      end

      context "when not available within threshold" do
        it "returns false" do
          @availability.hours = 96
          @availability.should_not be_kosher
        end
      end
    end
  end
end
