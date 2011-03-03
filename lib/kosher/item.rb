module Kosher
  class Item < Struct.new(:asin, :offers)

    class << self
      def build(doc)
        asin   = doc['ASIN']
        offers = build_offers(doc['Offers']['Offer'])

        new(asin, offers)
      end

      private

      def build_offers(offers)
        [offers].flatten.compact.map do |offer|

          # Senify Yen because Ruby Money says so
          price = offer['OfferListing']['Price']
          if price['CurrencyCode'] == 'JPY'
            price['Amount'] = price['Amount'].to_i * 100
          end

          Offer.build(offer)
        end
      end
    end
  end
end
