require 'spec_helper'

require 'kosher/seller/rating/amazon'

module Kosher
  class Seller
    class Rating
      describe Amazon do
        subject { Amazon.new }

        context 'given a new seller' do
          it { should be_kosher }
        end

        context 'given a low-volume seller' do
          before do
            subject.total = 10
          end

          context 'given average is at least 4.5' do
            before do
              subject.average = 4.5
            end

            it { should be_kosher }
          end

          context 'given average is less than 4.5' do
            before do
              subject.average = 4.4
            end

            it { should_not be_kosher }
          end
        end

        context 'given a high-volume seller' do
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
