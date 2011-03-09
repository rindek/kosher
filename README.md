Kosher
======

Kosher models an offer by a bookseller.

It knows if the offer is good or bad. It also knows if the offer is
better than another offer. It is somewhat overengineered.

![Booksellers](http://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Bucharest_booksellers_2.jpg/600px-Bucharest_booksellers_2.jpg)

Usage
-----

    include Kosher

    offer = Offer.new(1234,
                       Seller.new('ABCDEF',
                                  'John Doe Books',
                                  4.8),
                       Condition.new(1),
                       Description.new('A fine copy'),
                       48,
                       1000,
                       399,
                       'USD',
                       'http://bookseller.com/listings/1234'

    offer.kosher?
    => true

    offer.description = Description.new("Withdrawn library book")
    offer.kosher?
    => false
