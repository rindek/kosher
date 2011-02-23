module Kosher
  class Algorithm
    def initialize(response)
      @response = response
    end

    def items
      @response.map('Item') do |item|
        Item.build(item)
      end
    end

    def errors
      @response.errors.map do |error|
        error['Message'].scan(/[0-9A-Z]{10}/).first rescue nil
      end.compact
    end
  end
end
