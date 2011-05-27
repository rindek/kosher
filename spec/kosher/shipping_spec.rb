require 'spec_helper'

module Kosher
  describe Shipping do
    before do
      @shipping = Shipping.new
    end

    describe "#free?" do
      context "when shipping costs 0" do
        it "returns true" do
          @shipping.cents = 0
          @shipping.should be_free
        end
      end

      context "when shipping is not free" do
        it "returns false" do
          @shipping.cents = 1
          @shipping.should_not be_free
        end
      end
    end

    describe "#kosher?" do
      context "when available" do
        it "returns true" do
          @shipping.availability = Availability.new(:hours => 0)
          @shipping.should be_kosher
        end
      end

      context "when not available" do
        it "returns false" do
          @shipping.availability = Availability.new(:hours => 96)
          @shipping.should_not be_kosher
        end
      end
    end

    describe "#cost" do
      context "when no cents are specified" do
        it "raises an error" do
          expect do
            @shipping.cost
          end.to raise_error TypeError
        end
      end
    end
  end
end
