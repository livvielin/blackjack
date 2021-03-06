# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @set 'game-over', false
    @set 'winnerMessage', ""
    @get('playerHand').on 'checkPlayerBust', => @playerBust()
    @get('dealerHand').on('endGame', @outcome, @)

  reset: ->
    @get('playerHand').reset()
    @get('playerHand').add(@get('deck').pop()).add(@get('deck').pop())
    @get('dealerHand').reset()
    @get('dealerHand').add(@get('deck').pop().flip()).add(@get('deck').pop())
    @set('winnerMessage', "")
    @set('game-over', false)

  playerBust: -> 
    if @get('playerHand').scores() > 21
        @set('winnerMessage', "BUST! YOU LOSE!")
        @set('game-over', true)

  outcome: ->
    @set('game-over', true)
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


