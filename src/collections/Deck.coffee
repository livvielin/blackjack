class window.Deck extends Backbone.Collection
  model: Card

  # creating a shuffled deck of cards. each card has a rank and suit
  initialize: ->
    @add _([0...52]).shuffle().map (card) ->
      new Card
        rank: card % 13
        suit: Math.floor(card / 13)

  # we are creating a Hand Collection, one for the player and one for the dealer
  dealPlayer: -> new Hand [@pop(), @pop()], @

  dealDealer: -> new Hand [@pop().flip(), @pop()], @, true



