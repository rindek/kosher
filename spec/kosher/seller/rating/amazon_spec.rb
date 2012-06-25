require 'spec_helper'

require 'kosher/seller/rating/amazon'

module Kosher
  class Seller
    class Rating
      describe Amazon do
        subject { Amazon.new }

        context 'given no ratings' do
          it { should be_kosher }
        end

        context 'given less than 50 ratings' do
          before do
            subject.total = 10
            subject.average = 4.0
          end

          it { should be_kosher }
        end

        context 'given at least 50 ratings' do
          before do
            subject.total = 50
          end

          context 'given average is at least 4.8' do
            before do
              subject.average = 4.8
            end

            it { should be_kosher }
          end

          context 'given average is less than 4.8' do
            before do
              subject.average = 4.7
            end

            it { should_not be_kosher }
          end
        end
      end
    end
  end
end
