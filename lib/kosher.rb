require 'active_model'
require 'certainty'
require 'money'
require 'structure'

class Structure
  class InvalidRecord < StandardError
    def initialize(record)
      super record.errors.full_messages.join(', ')
    end
  end

  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend ActiveModel::Naming

  def persisted?
    false
  end

  private

  def validate!
    raise InvalidRecord.new(self) if invalid?
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
