require 'spec_helper'

module Kosher
  describe Offer do
    let(:offer) { Offer.new }

    describe "#kosher?" do
      describe "when condition is kosher" do
        before do
          offer.condition = Condition.new(1)
        end

        describe "when seller is kosher" do
          before do
            offer.seller = Seller.new
          end

          describe "when description is kosher" do
            before do
              offer.description = Description.new
            end

            describe "when offer ships now" do
              it "returns true" do
                offer.should be_kosher
              end
            end

            describe "when offer does not ship now" do
              before do
                offer.hours_shipped = 72
              end

              it "returns false" do
                offer.should_not be_kosher
              end
            end
          end

          describe "when description is not kosher" do
            before do
              offer.description = Description.new('Withdrawn library book')
            end

            it "returns false" do
              offer.should_not be_kosher
            end
          end
        end

        describe "when seller is not kosher" do
          before do
            offer.seller = Seller.new('foo', 'bar', 4.0)
          end

          it "returns false" do
            offer.should_not be_kosher
          end
        end
      end

      describe "when condition is not kosher" do
        before do
          offer.condition = Condition.new(5)
        end

        it "returns false" do
          offer.should_not be_kosher
        end
      end
    end

    describe "#available?" do
      before do
        Config.max_hours_shipped = 48
      end

      describe "when offer is expected to ship on time" do
        it "returns true" do
          offer.hours_shipped = 48
          offer.should be_available
        end
      end

      describe "when offer is not expected to ship on time" do
        it "returns false" do
          offer.hours_shipped = 96
          offer.should_not be_available
        end
      end
    end

    describe "#price" do
      it "returns the price" do
        offer.price_in_cents = 100
        offer.currency = 'USD'

        offer.price.should be_kind_of Money
        offer.price.format.should eql '$1.00'
      end
    end

    describe "#<=>" do
      before do
        offer.condition = Condition.new(1)
        offer.seller = Seller.new
        offer.description = Description.new
        offer.price_in_cents = 100
        offer.currency = 'EUR'
        @another_offer = offer.dup
      end

      context "when kosher" do
        it "is greater than a non-kosher offer" do
          @another_offer.condition = Condition.new(5)
          offer.should be_kosher
          @another_offer.should_not be_kosher

          offer.should be > @another_offer
        end

        context "when the other offer is kosher too" do
          it "is greater than another kosher offer with a higher price" do
            @another_offer.price_in_cents = 200

            offer.should be > @another_offer
          end

          it "is equal to another kosher offer with an equal price" do
            offer.should be == @another_offer
          end

          it "is less than another kosher offer with a lower price" do
            @another_offer.price_in_cents = 50

            offer.should be < @another_offer
          end
        end
      end

      context "when not kosher" do
        before do
          offer.condition = Condition.new(5)
        end

        it "is less than a kosher offer" do
          offer.should_not be_kosher
          @another_offer.should be_kosher

          offer.should be < @another_offer
        end

        context "when the other offer is not kosher either" do
          before do
            @another_offer.condition = Condition.new(5)
          end

          it "is greater than another unkosher offer with a higher price" do
            @another_offer.price_in_cents = 200

            offer.should be > @another_offer
          end

          it "is equal to another unkosher offer with an equal price" do
            offer.should be == @another_offer
          end

          it "is less than another unkosher offer with a lower price" do
            @another_offer.price_in_cents = 50

            offer.should be < @another_offer
          end
        end
      end
    end
  end
end
