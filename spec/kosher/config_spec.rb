require 'spec_helper'

module Kosher
  describe Config do
    describe ".base_currency" do
      it "defaults to EUR" do
        Config.base_currency = nil
        Config.base_currency.should eql 'EUR'
      end
    end

    describe ".blacklist" do
      it "defaults to an empty array" do
        Config.blacklist = nil
        Config.blacklist.should eql []
      end
    end

    describe ".max_hours_shipped" do
      it "defaults to 48" do
        Config.max_hours_shipped = nil
        Config.max_hours_shipped.should eql 48
      end
    end

    describe ".min_rating" do
      it "defaults to 4.8" do
        Config.min_rating = nil
        Config.min_rating.should eql 4.8
      end
    end

    describe ".min_condition" do
      it "defaults to 4" do
        Config.min_condition = nil
        Config.min_condition.should eql 4
      end
    end
  end
end
