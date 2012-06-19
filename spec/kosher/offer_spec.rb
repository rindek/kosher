require 'spec_helper'

require 'kosher/offer'

module Kosher
  describe Offer do
    let(:offer) { Offer.new }

    describe '#<=>' do
      let(:other) { Offer.new }

      context 'given a kosher offer' do
        before do
          offer.stub!(:kosher?).and_return true
        end

        context 'given other offer is also kosher' do
          before do
            other.stub!(:kosher?).and_return true
          end

          context 'given a lower price' do
            before do
              offer.stub!(:price).and_return Money.new 50
              other.stub!(:price).and_return Money.new 100
            end

            it 'is better than the other offer' do
              offer.should be < other
            end
          end

          context 'given a higher price' do
            before do
              offer.stub!(:price).and_return Money.new 100
              other.stub!(:price).and_return Money.new 50
            end

            it 'is worse than the other offer' do
              offer.should be > other
            end
          end

          context 'given the same price' do
            before do
              offer.stub!(:price).and_return Money.new 100
              other.stub!(:price).and_return Money.new 100
            end

            it 'is equal to the other offer' do
              offer.should eq other
            end
          end
        end

        context 'given other offer is not kosher' do
          before do
            other.stub!(:kosher?).and_return false
          end

          it 'is better than the other offer' do
            offer.should be < other
          end
        end
      end
    end

    describe '#kosher?' do
      subject { offer }

      context 'given no attributes' do
        it 'raises an error' do
          expect { subject.kosher? }.to raise_error TypeError
        end
      end

      context 'given default attributes' do
        before do
          Offer::KOSHER_ATTRIBUTES.each do |key|
            offer.send "#{key}=", Kosher.const_get(key.capitalize).new
          end
          offer.seller.rating = Seller::Rating.new
        end

        it { should be_kosher }
      end
    end
    describe '#venue' do
      subject { offer.venue }

      it { should be_an OpenStruct }
    end
  end
end
