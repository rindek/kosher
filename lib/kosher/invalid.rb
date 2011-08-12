module Kosher
  class Invalid < StandardError
    def initialize(record)
      super(record.errors.full_messages.join(", "))
    end
  end
end
