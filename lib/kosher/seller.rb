module Kosher
  class Seller
    include Virtus

    attribute :id,     String
    attribute :name,   String
    attribute :rating, String
  end
end
