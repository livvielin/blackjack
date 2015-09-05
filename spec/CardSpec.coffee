assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52

  it "should deal cards to player and dealer", ->
    deck = new Deck()
    playerHand = deck.dealPlayer()
    dealerHand = deck.dealDealer()
    assert.strictEqual deck.length, 48
    assert.strictEqual playerHand.length, 2
    assert.strictEqual dealerHand.length, 2

describe "hand constructor", ->

  it "should create dealer hand", ->
    deck = new Deck()
    dealerHand = deck.dealDealer()
    assert.strictEqual dealerHand.isDealer, true

  it "should create player hand", ->
    deck = new Deck()
    playerHand = deck.dealPlayer()
    assert.strictEqual !!playerHand.isDealer, false
