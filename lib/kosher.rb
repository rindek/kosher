require 'active_model'
require 'certainty'
require 'money'
require 'structure'

module Kosher
  class NotValid < StandardError
    def initialize(record)
      super(record.errors.full_messages.join(', '))
    end
  end
end

class Structure
  include ActiveModel::Validations

  private

  def validate!
    raise NotValid.new(self) unless valid?
  end
end

require 'kosher/offer'
