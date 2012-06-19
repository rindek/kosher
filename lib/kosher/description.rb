require 'virtus'

module Kosher
  class Description
    include Virtus

    attribute :body, String
    attribute :language, String

    def kosher?
      true
    end
  end
end
