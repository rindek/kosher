require 'active_model'
require 'certainty'
require 'money'
require 'structure'

class Structure
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  def persisted?
    false
  end
end

module Kosher
  autoload :Condition, 'kosher/condition'
  autoload :Filter,    'kosher/filter'
  autoload :Offer,     'kosher/offer'
  autoload :Price,     'kosher/price'
  autoload :Seller,    'kosher/seller'
  autoload :Shipping,  'kosher/shipping'
  autoload :Unit,      'kosher/unit'
end
