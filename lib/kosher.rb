# Kosher is a somewhat overengineered attempt to abstract bookdealing into a
# set of models.

require 'money'
require 'structure'
require 'structure/json'

# Require this module before all models.
require 'kosher/threshold'

# Require the models.
require 'kosher/author'
require 'kosher/availability'
require 'kosher/book'
require 'kosher/condition'
require 'kosher/description'
require 'kosher/image'
require 'kosher/item'
require 'kosher/location'
require 'kosher/offer'
require 'kosher/seller'
require 'kosher/shipping'
require 'kosher/venue'

module Kosher
  class << self
    attr_writer :seller_blacklist

    def seller_blacklist
      @seller_blacklist ||= []
    end
  end

  # Set threshold defaults.
  Availability.threshold = 48
  Condition.threshold    = 4
  Seller.threshold       = 4.8
end
