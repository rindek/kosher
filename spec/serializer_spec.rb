require_relative 'spec_helper'

module Kosher
  describe Serializer do
    describe ".to_hash" do
      it "is recursive" do
        offer = Offer.new seller: Seller.new(name: 'foo')
        hsh = Serializer.to_hash offer
        hsh[:seller][:name].must_equal offer.seller.name
      end
    end
  end
end
