require 'spec_helper'

module Kosher
  describe Condition do
    describe "#kosher?" do
      before do
        Config.min_condition = 1
      end

      it "returns true if condition is equal to or better than minimum condition" do
        Condition.new(1).should be_kosher
      end

      it "returns false if condition is less than minimum condition" do
        Condition.new(2).should_not be_kosher
      end
    end
  end
end
