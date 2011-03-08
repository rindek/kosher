require File.expand_path('../test_helper', __FILE__)

module Kosher
  describe Offer do
    before do
      @offer = Offer.new
    end

    describe "#kosher?" do
      describe "when condition is kosher" do
        before do
          @offer.condition = Condition.new(1)
        end

        describe "when seller is kosher" do
          before do
            @offer.seller = Seller.new
          end

          describe "when description is kosher" do
            before do
              @offer.description = Description.new
            end

            describe "when offer ships now" do
              it "returns true" do
                @offer.must_be_kosher
              end
            end

            describe "when offer does not ship now" do
              before do
                @offer.hours_shipped = 72
              end

              it "returns false" do
                @offer.must_not_be_kosher
              end
            end
          end

          describe "when description is not kosher" do
            before do
              @offer.description = Description.new('Withdrawn library book')
            end

            it "returns false" do
              @offer.must_not_be_kosher
            end
          end
        end

        describe "when seller is not kosher" do
          before do
            @offer.seller = Seller.new('foo', 'bar', 4.0)
          end

          it "returns false" do
            @offer.must_not_be_kosher
          end
        end
      end

      describe "when condition is not kosher" do
        before do
          @offer.condition = Condition.new(5)
        end

        it "returns false" do
          @offer.must_not_be_kosher
        end
      end
    end

    describe "#available?" do
      before do
        Config.max_hours_shipped = 48
      end

      describe "when offer is expected to ship on time" do
        it "returns true" do
          @offer.hours_shipped = 48
          @offer.must_be_available
        end
      end

      describe "when offer is not expected to ship on time" do
        it "returns false" do
          @offer.hours_shipped = 96
          @offer.must_not_be_available
        end
      end
    end

    describe "#price" do
      it "returns the price" do
        @offer.price_in_cents = 100
        @offer.currency = 'USD'

        @offer.price.must_be_kind_of Money
        @offer.price.format.must_equal '$1.00'
      end
    end

    describe "#>" do
      before do
        @offer.condition = Condition.new(1)
        @offer.seller = Seller.new
        @offer.description = Description.new
        @offer.price_in_cents = 100
        @offer.currency = 'EUR'
        @another_offer = @offer.dup
      end

      describe "when kosher" do
        it "is greater than a non-kosher offer" do
          @another_offer.condition = Condition.new(5)
          @offer.must_be_kosher
          @another_offer.must_not_be_kosher

          @offer.must_be :>, @another_offer
        end

        it "is greater than another kosher offer with a higher price" do
          @another_offer.price_in_cents = 200

          @offer.must_be :>, @another_offer
        end

        it "is equal to another kosher offer with an equal price" do
          @offer.must_be :==, @another_offer
        end

        it "is less than another kosher offer with a lower price" do
          @another_offer.price_in_cents = 50

          @offer.must_be :<, @another_offer
        end
      end

      describe "when not kosher" do
        before do
          @offer.condition = Condition.new(5)
        end

        it "is less than a kosher offer" do
          @offer.must_not_be_kosher
          @another_offer.must_be_kosher

          @offer.must_be :<, @another_offer
        end

        describe "when the other offer is not kosher either" do
          before do
            @another_offer.condition = Condition.new(5)
          end

          it "is greater than another unkosher offer with a higher price" do
            @another_offer.price_in_cents = 200

            @offer.must_be :>, @another_offer
          end

          it "is equal to another unkosher offer with an equal price" do
            @offer.must_be :==, @another_offer
          end

          it "is less than another unkosher offer with a lower price" do
            @another_offer.price_in_cents = 50

            @offer.must_be :<, @another_offer
          end
        end
      end
    end
  end
end
