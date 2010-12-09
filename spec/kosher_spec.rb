require "spec_helper"

describe Kosher do
  describe(".new") do
    it "returns an instance of Kosher::String" do
      Kosher.new("foo").should be_a_kind_of Kosher::String
    end
  end
end
