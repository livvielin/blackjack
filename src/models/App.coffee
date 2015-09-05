# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'winnerMessage', ""
    @get('playerHand').on 'checkPlayerBust', => @playerBust()
    @get('dealerHand').on('endGame', @outcome, @)

  playerBust: -> 
    if @get('playerHand').scores() > 21
    then @set('winnerMessage', "BUST! YOU LOSE!")

# still needs to handle blackjack
  outcome: ->
    playerScore = @get('playerHand').scores()
    dealerScore = @get('dealerHand').scores()

    # for the cases of blackjacks
    playerHasBlackJack = playerScore == 21 and @get('playerHand').models.length == 2
    dealerHasBlackJack = dealerScore == 21 and @get('dealerHand').models.length == 2

    if playerHasBlackJack and dealerHasBlackJack
    then @set('winnerMessage', "It's a tie.")
    else if playerHasBlackJack 
    then @set('winnerMessage', "YOU WIN!")
    else if dealerHasBlackJack
    then @set('winnerMessage', "YOU LOSE :(")

    # for all other cases
    else if dealerScore > 21 or dealerScore < playerScore
    then @set('winnerMessage', "YOU WIN!")
    else if dealerScore == playerScore
    then @set('winnerMessage', "It's a tie.")
    else @set('winnerMessage', "YOU LOSE :(")
