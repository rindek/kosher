require 'spec_helper'

module Kosher
  describe Condition do
    before do
      @condition = Condition.new
    end

    describe "#kosher?" do
      before do
        Condition.threshold = 4
      end

      context "when grade within threshold" do
        it "returns true" do
          @condition.grade = 4
          @condition.should be_kosher
        end
      end

      context "when grade not within threshold" do
        it "returns false" do
          @condition.grade = 5
          @condition.should_not be_kosher
        end
      end
    end
  end
end
