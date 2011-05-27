require 'spec_helper'

module Kosher
  describe Availability do
    before do
      @availability = Availability.new
    end

    describe "#kosher?" do
      before do
        Availability.threshold = 48
      end

      context "when available within threshold" do
        before do
          @availability.hours = 48
        end

        it "returns true" do
          @availability.should be_kosher
        end
      end

      context "when not available within threshold" do
        before do
          @availability.hours = 96
        end

        it "should return false" do
          @availability.should_not be_kosher
        end
      end

      context "when availability is not known" do
        it "should return false" do
          @availability.should_not be_kosher
        end
      end
    end
  end
end
