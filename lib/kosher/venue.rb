module Kosher
  class Venue < Structure
    key :country, String
    key :name,    String

    set_data_file File.expand_path("../../../data/venues.yml", __FILE__)

    def self.amazon
      @amazons ||= find_all { |e| e.name.include? 'Amazon' }
    end
  end
end
