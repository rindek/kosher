module Kosher
  class Snapshot < Struct.new(:venue, :isbn, :asin, :sales_rank, :offers_count, :offers, :created_at)
  end
end
