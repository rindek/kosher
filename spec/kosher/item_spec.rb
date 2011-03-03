require 'spec_helper'

module Kosher
  describe Item do
    describe ".build" do
      use_vcr_cassette '0143105825'

      let(:asin) { '0143105825' }

      let(:response) do
        request = Request.new(credentials)
        request.locale = :us
        request.batchify([asin])
        algorithm = request.get

        algorithm.instance_variable_get(:@response)
      end

      let(:item) do
        doc = response.find('Item').first
        Item.build(doc)
      end

      it "should build an item" do
        item.should be_a Item
        item.asin.should eql asin
        item.offers_count.should be > 0
        item.sales_rank.should be > 0
        item.offers.count.should > 0
        item.offers.first.should be_a Offer
      end
    end
  end
end
