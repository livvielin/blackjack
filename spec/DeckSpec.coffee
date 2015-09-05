assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      assert.strictEqual deck.last(), hand.hit()
      assert.strictEqual deck.length, 49

  describe 'stand', ->
    it 'should deal to dealer until score is greater than 16', ->
      hand.stand()
      assert.strictEqual hand.scores() <= 16, false

  describe 'hasAce', ->
    it 'should return true when there is an Ace in the hand', ->
      ace = new Card rank: 1
      card = new Card rank: 10
      testHand = new Hand [ace, card], deck
      assert.strictEqual testHand.hasAce(), true

    it 'should return false when there is no Ace in the hand', ->
      card = new Card rank: 10
      card2 = new Card rank: 5
      testHand = new Hand [card, card2], deck
      assert.strictEqual testHand.hasAce(), false

  describe 'minScore', ->
    it 'should return the minimum score the hand could have', ->
      ace = new Card rank: 1
      card = new Card rank: 10
      card2 = new Card rank: 5
      testHand = new Hand [ace, card, card2], deck
      assert.strictEqual testHand.scores(), 16

  describe 'scores', ->
    it 'should return the sum of the hand\'s values', ->
      card = new Card rank: 10
      card2 = new Card rank: 5
      testHand = new Hand [card, card2], deck
      assert.strictEqual testHand.scores(), 15

    it 'should treat ace as an 11 in calculating score if no bust', ->
      ace = new Card rank: 1
      card = new Card rank: 10
      testHand = new Hand [ace, card], deck
      assert.strictEqual testHand.scores(), 21
