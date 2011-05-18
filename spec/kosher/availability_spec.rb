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

      context "true" do
        it "when available within threshold" do
          @availability.hours = 48
          @availability.should be_kosher
        end
      end

      context "false" do
        after { @availability.should_not be_kosher }

        it "when not available within threshold" do
          @availability.hours = 96
        end

        it "when available for preorder" do
          @availability.hours = 48
          @availability.preorder = true
        end
      end
    end
  end
end
