class window.HandView extends Backbone.View
  className: 'hand'

  #will show a different template whether it's the dealer or not.
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change', => @render()
    @collection.on 'checkPlayerBust', => @playerBust()
    @render()

  playerBust: -> 
    if @collection.scores() > 21
    then console.log("player LOSES")

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()
    # if @collection.playerBust()
    # then alert("You lose. Dealer wins.")
 
