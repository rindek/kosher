require 'active_model'
require 'certainty'
require 'money'
require 'structure'

class Structure
  class InvalidRecord < StandardError
    def initialize(record)
      msg = record.errors.full_messages.join(', ')
      super msg
    end
  end

  include ActiveModel::Conversion
  include ActiveModel::Validations
  extend  ActiveModel::Naming

  def persisted?
    false
  end

  private

  def raise_error_if_invalid
    raise InvalidRecord.new(self) if invalid?
  end
end

require 'kosher/offer'
