require 'spec_helper'

module Kosher
  describe Item do
    before do
      @item = Item.new
    end

    describe "#kosher?" do
      context "when condition is kosher" do
        before do
          @item.condition = Condition.new(1)
        end

        context "when description is kosher" do
          before do
            @item.description = Description.new('')
          end

          it "returns true" do
            @item.should be_kosher
          end
        end

        context "when description is not kosher" do
          before do
            @item.description = Description.new('Withdrawn library book')
          end

          it "returns false" do
            @item.should_not be_kosher
          end
        end
      end

      context "when condition is not kosher" do
        before do
          @item.condition = Condition.new(5)
        end

        it "returns false" do
          @item.should_not be_kosher
        end
      end
    end
  end
end
