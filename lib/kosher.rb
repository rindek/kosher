require 'active_model'
require 'money'
require 'structure'

module Kosher
  autoload :Invalid,  'kosher/invalid'
  autoload :Item,     'kosher/item'
  autoload :Offer,    'kosher/offer'
  autoload :Seller,   'kosher/seller'
  autoload :Shipping, 'kosher/shipping'
  autoload :Unit,     'kosher/unit'
  autoload :Venue,    'kosher/venue'
end
