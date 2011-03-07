require 'sucker'
require 'kosher/struct'
require 'kosher/algorithm'
require 'kosher/condition'
require 'kosher/description'
require 'kosher/errors'
require 'kosher/item'
require 'kosher/offer'
require 'kosher/request'
require 'kosher/seller'

module Kosher
  def self.new(args={})
    Request.new(args)
  end
end
