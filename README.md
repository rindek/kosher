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
    => #<Money cents:1399 currency:EUR>

    another_offer.kosher?
    => true
    another_offer.price
    => #<Money cents:1499 currency:EUR>

    offer > another_offer
    => true
