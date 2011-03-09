require 'spec_helper'

module Kosher
  describe Description do
    before do
      @description = Description.new
    end

    describe "#kosher?" do
      it "validates a blank description" do
        @description.text = ''
        @description.should be_kosher
      end

      it "validates a non-blank description" do
        @description.text = 'foo'
        @description.should be_kosher
      end

      it "does not validate advance review copies" do
        @description.text = 'Uncorrected review copy'
        @description.should_not be_kosher

        @description.text = 'arc'
        @description.should_not be_kosher

        @description.text = 'arc.'
        @description.should_not be_kosher

        @description.text = 'marc'
        @description.should be_kosher
      end

      it "does not validate marked books" do
        @description.text = 'Some highlighting'
        @description.should_not be_kosher

        @description.text = 'Underlining.'
        @description.should_not be_kosher

        @description.text = 'Good. Hiliting.'
        @description.should_not be_kosher

        @description.text = 'No highlighting.'
        @description.should be_kosher
      end

      it "does not validate books with missing volumes" do
        @description.text = 'First vol only.'
        @description.should_not be_kosher
      end

      it "does not validate damaged or worn books" do
        @description.text = 'Different'
        @description.should be_kosher

        @description.text = 'Rental'
        @description.should_not be_kosher

        @description.text = 'Torn pages'
        @description.should_not be_kosher
      end

      it "does not validate withdrawn library copies" do
        @description.text = 'xlib'
        @description.should_not be_kosher

        @description.text = 'ex-library'
        @description.should_not be_kosher

        @description.text = 'retired library copy'
        @description.should_not be_kosher

        @description.text = 'Not an ex-library'
        @description.should be_kosher
      end
    end
  end
end
