assert = chai.assert

describe 'blackjack logic', ->
  deck = null

  beforeEach ->
    deck = new Deck()

  describe 'player win', ->
    it 'should say that player wins when player has higher score', ->
      game = new App()
      card = new Card rank: 10
      card2 = new Card rank: 5
      card3 = new Card rank: 5
      game.set('playerHand', (new Hand [card, card2, card3], game.get('deck')))
      game.set('dealerHand', (new Hand [card, card2], game.get('deck')))
      game.outcome()
      assert.strictEqual game.get('winnerMessage'), 'YOU WIN!'

    it 'should say that player wins when dealer busts', ->
      game = new App()
      card = new Card rank: 10
      card2 = new Card rank: 5
      card3 = new Card rank: 5
      card4 = new Card rank: 8
      game.set('playerHand', (new Hand [card, card2, card3], game.get('deck')))
      game.set('dealerHand', (new Hand [card, card2, card4], game.get('deck')))
      game.outcome()
      assert.strictEqual game.get('winnerMessage'), 'YOU WIN!'

  describe 'dealer win', ->
    it 'should say that the dealer wins when dealer has higher score', ->
      game = new App()
      card = new Card rank: 10
      card2 = new Card rank: 5
      card3 = new Card rank: 5
      game.set('dealerHand', (new Hand [card, card2], game.get('deck')))
      game.set('playerHand', (new Hand [card2, card3], game.get('deck')))
      game.outcome()
      assert.strictEqual game.get('winnerMessage'), 'YOU LOSE :('

  describe 'playerBust', ->
    it 'should say that the player busts when player busts', ->
      game = new App()
      card = new Card rank: 10
      card2 = new Card rank: 5
      card3 = new Card rank: 5
      game.set('playerHand', (new Hand [card2, card3], game.get('deck')))

  describe 'blackjack', ->
    it 'should return true when there is an Ace in the hand', ->
      ace = new Card rank: 1
      card = new Card rank: 10
      testHand = new Hand [ace, card], deck
      assert.strictEqual testHand.hasAce(), true
