require 'spec_helper'

require 'kosher/shipping'

module Kosher
  describe Shipping do
    subject { Shipping.new }

    context 'by default' do
      it { should be_kosher }
    end

    context 'given stock is not at hand' do
      before do
        subject.available = false
      end

      it { should_not be_kosher }
    end
  end
end
