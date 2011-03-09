Kosher
======

Kosher models booksellers' offers.

It knows if an offer is good or bad. It is also able to compare offers.

It is somewhat overengineered.

![Booksellers](http://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Bucharest_booksellers_2.jpg/600px-Bucharest_booksellers_2.jpg)

Usage
-----

    offer.kosher?
    => true
    offer.price
    => #<Money cents:100 currency:EUR>

    another_offer.kosher?
    => true
    another_offer.price
    => #<Money cents:200 currency:EUR>

    [another_offer, offer].sort.map(&:price)
    => [#<Money cents:100 currency:EUR>, #<Money cents:200 currency:EUR>]
