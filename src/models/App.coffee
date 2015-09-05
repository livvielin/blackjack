# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('dealerHand').on('endGame', @outcome, @)

  outcome: ->
    playerScore = @get('playerHand').scores()
    dealerScore = @get('dealerHand').scores()

    if dealerScore > 21 or dealerScore < playerScore
    then console.log("dealer loses")
    else if dealerScore == playerScore
    then console.log("TIEEE")
    else console.log("player loses!")
