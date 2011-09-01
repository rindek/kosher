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

class Structure
  include ActiveModel::Validations

  private

  def raise_error_if_invalid
    raise InvalidRecord.new(self) if invalid?
  end
end

require 'kosher/offer'
