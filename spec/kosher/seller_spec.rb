require 'spec_helper'

module Kosher
  describe Seller do
    before do
      Config.blacklist = nil
    end

    describe "#blacklisted?" do
      before do
        Config.blacklist = ['foo']
      end

      it "returns true if the seller is blacklisted" do
        Seller.new('foo').should be_blacklisted
      end

      it "returns false if the seller is not blacklisted" do
        Seller.new('bar').should_not be_blacklisted
      end
    end

    describe "#kosher?" do
      before do
        Config.min_rating = 4.8
      end

      it "returns true if seller's average rating is 0.0" do
        seller = Seller.new('foo', 'bar', 0.0)
        seller.should be_kosher
      end

      it "returns true if seller's average rating is nil" do
        seller = Seller.new
        seller.should be_kosher
      end

      it "returns true if seller's average rating is equal to or above the min average rating" do
        seller = Seller.new('foo', 'bar', 4.8)
        seller.should be_kosher
      end

      it "returns false if sellers' average rating is below the min average rating" do
        seller = Seller.new('foo', 'bar', 4.7)
        seller.should_not be_kosher
      end

      it "returns false if seller is blacklisted" do
        seller = Seller.new('foo', 'bar', 5.0)
        seller.should be_kosher

        Config.blacklist = [seller.id]
        seller.should_not be_kosher
      end
    end
  end
end
