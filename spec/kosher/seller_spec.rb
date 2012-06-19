require 'spec_helper'

require 'kosher/seller'

module Kosher
  describe Seller do
    subject { Seller.new }

    context 'given an Amazon seller' do
      before do
        subject.rating = Seller::Rating::Amazon.new
      end

      context 'given a good rating' do
        it { should be_kosher }
      end

      context 'given a bad rating' do
        before do
          subject.rating.tap do |rating|
            rating.total = 10
            rating.average = 4.0
          end
        end

        it { should_not be_kosher }
      end
    end
  end
end
