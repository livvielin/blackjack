class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @trigger('checkPlayerBust', this)
    @last()
   
  dealerHit: ->
    @add(@deck.pop())
    @last()

  stand: -> 
    @models[0].flip()
    @dealerHit() while @scores() < 17 
    @trigger('endGame', this)

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    possibleScores =[@minScore(), @minScore() + 10 * @hasAce()]
    if possibleScores[1] > 21 
    then score = possibleScores[0] 
    else score = possibleScores[1]
    score

  bust: -> 

    if @scores() > 21
    then result = true
    else result = false
    result




