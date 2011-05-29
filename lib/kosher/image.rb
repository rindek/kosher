module Kosher

  # An image of a book cover.
  class Image < Structure
    key :height, :type => Integer
    key :url,    :type => URI
    key :width,  :type => Integer
  end
end
