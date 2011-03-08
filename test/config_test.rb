require File.expand_path('../test_helper', __FILE__)

module Kosher
  describe Config do
    describe ".base_currency" do
      it "defaults to EUR" do
        Config.base_currency.must_equal 'EUR'
      end
    end

    describe ".blacklist" do
      it "defaults to an empty array" do
        Config.blacklist.must_equal []
      end
    end

    describe ".max_hours_shipped" do
      it "defaults to 48" do
        Config.max_hours_shipped.must_equal 48
      end
    end

    describe ".min_average_rating" do
      it "defaults to 4.8" do
        Config.min_average_rating.must_equal 4.8
      end
    end

    describe ".min_condition" do
      it "defaults to 4" do
        Config.min_condition.must_equal 4
      end
    end
  end
end
