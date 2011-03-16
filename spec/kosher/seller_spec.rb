require 'spec_helper'

module Kosher
  describe Seller do
    before do
      @seller = Seller.new
    end

    describe "#blacklist" do
      it "defaults to an empty array" do
        @seller.blacklist.should eql []
      end
    end

    describe "#blacklisted?" do
      before do
        Seller.blacklist = ['foo']
      end

      it "returns true if the seller is blacklisted" do
        @seller.id = 'foo'
        @seller.should be_blacklisted
      end

      it "returns false if the seller is not blacklisted" do
        @seller.id = 'bar'
        @seller.should_not be_blacklisted
      end
    end

    describe "#kosher?" do
      before do
        Seller.threshold = 4.8
      end

      it "returns true if rating is 0.0" do
        @seller.rating = 0.0
        @seller.should be_kosher
      end

      it "returns true if rating is nil" do
        @seller.should be_kosher
      end

      it "returns true if rating is within threshold" do
        @seller.rating = 4.8
        @seller.should be_kosher
      end

      it "returns false if rating is not within threshold" do
        @seller.rating = 4.7
        @seller.should_not be_kosher
      end

      it "returns false if seller is blacklisted" do
        @seller.id = ['foo']
        Seller.blacklist = [@seller.id]
        @seller.should_not be_kosher
      end
    end
  end
end
