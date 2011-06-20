require 'spec_helper'

module Kosher
  describe Shipping do
    before do
      @shipping = Shipping.new
    end

    describe "#free?" do
      context "when shipping costs 0" do
        it "returns true" do
          @shipping.cost = Price.new(cents: 0)
          @shipping.should be_free
        end
      end

      context "when shipping is not free" do
        it "returns false" do
          @shipping.cost = Price.new(cents: 1)
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
  end
end
