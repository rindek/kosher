require 'spec_helper'

module Kosher
  describe Description do
    it "validates a blank description" do
      Description.new('').should be_kosher
    end

    it "validates a non-blank description" do
      Description.new('foo').should be_kosher
    end

    it "does not validate advance review copies" do
      Description.new('Uncorrected review copy').should_not be_kosher
      Description.new('arc').should_not be_kosher
      Description.new('arc.').should_not be_kosher

      Description.new('marc').should be_kosher
    end

    it "does not validate marked books" do
      Description.new('Some highlighting').should_not be_kosher
      Description.new('Underlining.').should_not be_kosher
      Description.new('Good. Hiliting.').should_not be_kosher

      Description.new('No highlighting.').should be_kosher
    end

    it "does not validate books with missing volumes" do
      Description.new('First vol only.').should_not be_kosher
    end

    it "does not validate damaged or worn books" do
      Description.new('Different').should be_kosher
      Description.new('Rental').should_not be_kosher
      Description.new('Torn pages').should_not be_kosher
    end

    it "does not validate withdrawn library copies" do
      Description.new('xlib').should_not be_kosher
      Description.new('ex-library').should_not be_kosher
      Description.new('retired library copy').should_not be_kosher

      Description.new('Not an ex-library').should be_kosher
    end
  end
end
