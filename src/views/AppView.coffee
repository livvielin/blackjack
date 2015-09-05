class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <button class="new-game-button">NEW GAME</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .new-game-button': -> @newGame()
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('dealerHand').stand()

  initialize: ->
    @model.on 'change', => @displayWinner()
    @render()

  newGame: ->
    @model.reset()
    $('.winMessage').remove()

  displayWinner: -> 
    @$el.append("<div class='winMessage'>"+@model.get('winnerMessage')+"</div>")

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
