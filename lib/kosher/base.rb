module Kosher
  module Base
    extend ActiveSupport::Concern
    include ActiveModel::Validations

    included do
      key :foo
      key :kosher, Boolean, :default => true
    end

    def kosher?
      unless valid?
        raise StandardError.new(errors.full_messages.join(", "))
      end

      kosher
    end
  end
end
