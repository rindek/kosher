module Kosher

  # A book.
  #
  # A book is sold on many venues and has many offers through those venues.
  class Book < Structure
    key      :asin
    key      :edition
    key      :format
    key      :images,       :type => Hash
    key      :isbn
    key      :pages,        :type => Integer
    key      :published_in, :type => Integer
    key      :publisher
    key      :title
    key      :volumes,      :type => Integer
    has_many :alternate_versions
    has_many :authors
    has_many :offers
    has_many :related_items

    # The best kosher offer.
    #
    # Returns nil if there are no (kosher) offers.
    def best_kosher_offer
      offer = offers.sort.first
      offer && offer.kosher? ? offer : nil
    end

    # A full bibliographic description of the book, as in:
    #
    #   Chronicle Books, 1991. Hardcover. 1st edition. 2 volumes. 1200 pages.
    #
    # Missing attributes are omitted.
    def description
      # TODO
    end
  end
end
