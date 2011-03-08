require File.expand_path('../test_helper', __FILE__)

module Kosher
  describe Condition do
    describe ".from_amazon" do
      it "imports Amazon conditions" do
        Condition.from_amazon('new').grade.must_equal 1
        Condition.from_amazon('mint').grade.must_equal 2
        Condition.from_amazon('verygood').grade.must_equal 3
        Condition.from_amazon('good').grade.must_equal 4
        Condition.from_amazon('acceptable').grade.must_equal 5
      end

      it "casts unrecognized terms to 6" do
        Condition.from_amazon('refurbished').grade.must_equal 6
      end
    end

    describe "#kosher?" do
      before do
        Config.min_condition = 1
        @condition = Condition.new
      end

      it "returns true if condition is equal to or better than minimum condition" do
        @condition.grade = 1
        @condition.must_be_kosher
      end

      it "returns false if condition is less than minimum condition" do
        @condition.grade = 2
        @condition.must_not_be_kosher
      end
    end
  end
end
