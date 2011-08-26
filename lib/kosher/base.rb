module Kosher
  class Base < Structure
    include ActiveModel::Validations

    def self.inherited(child)
      child.key :foo
      child.key :kosher, Boolean, :default => true
    end

    def kosher?
      unless valid?
        raise StandardError.new(errors.full_messages.join(', '))
      end

      kosher
    end
  end
end
