require 'spec_helper'

require 'kosher/seller'

module Kosher
  describe Seller do
    subject do
      Seller.new.tap do |seller|
        seller.stub! :rating
      end
    end

    context 'given a good rating' do
      before do
        subject.rating.stub!(:kosher?).and_return true
      end

      it { should be_kosher }
    end

    context 'given a bad rating' do
      before do
        subject.rating.stub!(:kosher?).and_return false
      end

      it { should_not be_kosher }
    end
  end
end
