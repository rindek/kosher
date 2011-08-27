require 'yaml'

module Kosher
  class Venue < Structure
    DATA_PATH = File.expand_path("../../../data/venues.yml", __FILE__)

    key :_id,     Integer
    key :country, String
    key :name,    String

    class << self
      include Enumerable

      def all
        @all ||= YAML.load_file(DATA_PATH).map do |hsh|
          hsh['_id'] ||= hsh.delete('id')
          new(hsh)
        end
      end

      def amazon
        @amazons ||= find_all { |e| e.name.include? 'Amazon' }
      end

      def each(&block)
        all.each { |item| block.call(item) }
      end

      def find(id)
        super() { |item| item._id == id }
      end
    end
  end
end
