require 'spec_helper'

module Kosher
  describe Book do
    describe "#best_kosher_offer" do
      before do
        @book = Book.new
        @book.offers = []

        @offer1 = Offer.new
        @offer2 = Offer.new
      end

      context "when there are more than one kosher offers" do
        before do
          @offer1.stub!(:kosher?).and_return(true)
          @offer1.stub!(:price).and_return(Money.new(200, 'EUR'))
          @book.offers << @offer1

          @offer2.stub!(:kosher?).and_return(true)
          @offer2.stub!(:price).and_return(Money.new(100, 'EUR'))
          @book.offers << @offer2
        end

        it "returns the kosher offer with the lower price" do
          @book.best_kosher_offer.should eql @offer2
        end
      end

      context "when there is one kosher and one unkosher offer" do
        before do
          @offer1.stub!(:kosher?).and_return(true)
          @offer1.stub!(:price).and_return(Money.new(200, 'EUR'))
          @book.offers << @offer1

          @offer2.stub!(:kosher?).and_return(false)
          @offer2.stub!(:price).and_return(Money.new(100, 'EUR'))
          @book.offers << @offer2
        end

        it "returns the best kosher offer" do
          @book.best_kosher_offer.should eql @offer1
        end
      end

      context "when there is one kosher offer" do
        before do
          @offer1.stub!(:kosher?).and_return(true)
          @offer1.stub!(:price).and_return(Money.new(100, 'EUR'))
          @book.offers << @offer1
        end

        it "returns the kosher offer" do
          @book.best_kosher_offer.should eql @offer1
        end
      end

      context "when there is one unkosher offer" do
        before do
          @offer1.stub!(:kosher?).and_return(false)
          @offer1.stub!(:price).and_return(Money.new(100, 'EUR'))
          @book.offers << @offer1
        end

        it "returns nil" do
          @book.best_kosher_offer.should be_nil
        end
      end
    end
  end
end
