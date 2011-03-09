require 'spec_helper'

module Kosher
  describe Offer do
    before do
      @offer = Offer.new
      @offer.item = Item.new
      @offer.seller = Seller.new
      @offer.shipping = Shipping.new
    end

    describe "#kosher?" do
      context "when item is kosher" do
        before do
          @offer.item.stub!(:kosher?).and_return(true)
        end

        context "when seller is kosher" do
          before do
            @offer.seller.stub!(:kosher?).and_return(true)
          end

          context "when shipping is kosher" do
            before do
              @offer.shipping.stub!(:kosher?).and_return(true)
            end

            it "returns true" do
              @offer.should be_kosher
            end
          end

          context "when shipping is not kosher" do
            before do
              @offer.shipping.stub!(:kosher?).and_return(false)
            end

            it "returns false" do
              @offer.should_not be_kosher
            end
          end
        end

        context "when seller is not kosher" do
          before do
            @offer.seller.stub!(:kosher?).and_return(false)
          end

          it "returns false" do
            @offer.should_not be_kosher
          end
        end
      end

      context "when item is not kosher" do
        before do
          @offer.item.stub!(:kosher?).and_return(false)
        end

        it "returns false" do
          @offer.should_not be_kosher
        end
      end
    end

    describe "#price" do
      it "sum of item price and shipping cost" do
        @offer.item.cents = 1000
        @offer.item.currency = 'EUR'

        @offer.shipping.cents = 399
        @offer.shipping.currency = 'EUR'

        @offer.price.cents.should eql 1399
        @offer.price.currency.iso_code.should eql 'EUR'
      end
    end

    describe "#<=>" do
      before do
        @another_offer = Offer.new
      end

      context "when kosher" do
        before do
          @offer.stub!(:kosher?).and_return(true)
        end

        it "is greater than a non-kosher offer" do
          @another_offer.stub!(:kosher?).and_return(false)
          @offer.should > @another_offer
        end

        context "when the other offer is kosher as well" do
          before do
            @offer.stub!(:price).and_return(Money.new(100, 'EUR'))
            @another_offer.stub!(:kosher?).and_return(true)
          end

          context "when it has a lower price" do
            before do
              @another_offer.stub!(:price).and_return(Money.new(150, 'EUR'))
            end

            it "is less than other offer" do
              @offer.should < @another_offer
            end
          end

          context "when the prices are equal" do
            before do
              @another_offer.stub!(:price).and_return(Money.new(100, 'EUR'))
            end

            it "is equal to the other offer" do
              @offer.should <=> @another_offer
            end
          end

          context "when it has a higher price" do
            before do
              @another_offer.stub!(:price).and_return(Money.new(50, 'EUR'))
            end

            it "is greater than the other offer" do
              @offer.should > @another_offer
            end
          end
        end
      end

      context "when not kosher" do
        before do
          @offer.stub!(:kosher?).and_return(false)
        end

        it "is less than a kosher offer" do
          @another_offer.stub!(:kosher?).and_return(true)
          @offer.should < @another_offer
        end

        context "when the other offer is not kosher either" do
          before do
            @offer.stub!(:price).and_return(Money.new(100, 'EUR'))
            @another_offer.stub!(:kosher?).and_return(false)
          end

          context "when it has a lower price" do
            before do
              @another_offer.stub!(:price).and_return(Money.new(150, 'EUR'))
            end

            it "is less than the other offer" do
              @offer.should < @another_offer
            end
          end

          context "when the prices are equal" do
            before do
              @another_offer.stub!(:price).and_return(Money.new(100, 'EUR'))
            end

            it "is equal to the other offer" do
              @offer.should <=> @another_offer
            end
          end

          context "when it has a higher price" do
            before do
              @another_offer.stub!(:price).and_return(Money.new(50, 'EUR'))
            end

            it "is greater than the other offer" do
              @offer.should > @another_offer
            end
          end
        end
      end
    end
  end
end
