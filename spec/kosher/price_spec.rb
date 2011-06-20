require 'spec_helper'

module Kosher
  describe Price do
    describe "#to_money" do
      it "returns a Money object" do
        price = Price.new(:cents => 100, :currency => 'USD')
        price.to_money.should be_a Money
      end

      it "raises a type error if cents is nil" do
        expect { Price.new.to_money }.to raise_error TypeError
      end
    end
  end
end
