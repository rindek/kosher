require 'spec_helper'

require 'kosher/condition'

module Kosher
  describe Condition do
    let(:condition) { Condition.new }

    describe '#new?' do
      subject { condition.new? }

      context 'given a grade of 1' do
        before do
          condition.grade = 1
        end

        it { should be_true }
      end

      context ' given a grade less than 1' do
        before do
          condition.grade = 2
        end

        it { should be_false }
      end
    end
  end
end
