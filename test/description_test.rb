require File.expand_path('../test_helper', __FILE__)

module Kosher
  describe Description do
    it "inherits from String" do
      Description.ancestors.must_include String
    end

    it "validates a blank description" do
      Description.new.must_be_kosher
      Description.new('').must_be_kosher
    end

    it "validates a non-blank description" do
      Description.new('foo').must_be_kosher
    end

    it "does not validate advance review copies" do
      Description.new('Uncorrected review copy').must_not_be_kosher
      Description.new('arc').must_not_be_kosher
      Description.new('arc.').must_not_be_kosher

      Description.new('marc').must_be_kosher
    end

    it "does not validate marked books" do
      Description.new('Some highlighting').must_not_be_kosher
      Description.new('Underlining.').must_not_be_kosher
      Description.new('Good. Hiliting.').must_not_be_kosher

      Description.new('No highlighting.').must_be_kosher
    end

    it "does not validate books with missing volumes" do
      Description.new('First vol only.').must_not_be_kosher
    end

    it "does not validate damaged or worn books" do
      Description.new('Different').must_be_kosher
      Description.new('Rental').must_not_be_kosher
      Description.new('Torn pages').must_not_be_kosher
    end

    it "does not validate withdrawn library copies" do
      Description.new('xlib').must_not_be_kosher
      Description.new('ex-library').must_not_be_kosher
      Description.new('retired library copy').must_not_be_kosher

      Description.new('Not an ex-library').must_be_kosher
    end
  end
end
