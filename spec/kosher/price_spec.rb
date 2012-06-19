require 'spec_helper'
require 'kosher/price'

module Kosher
  class Product
    include Price
  end

  describe Price do
    let(:product) { Product.new currency: 'USD' }

    describe '#price' do
      subject { product.price }

      context 'given no cents' do
        it 'raises an error' do
          expect { subject }.to raise_error TypeError
        end
      end

      context 'given cents' do
        before do
          product.cents = 100
        end

        it { should be_a Money }
      end
    end
  end
end
