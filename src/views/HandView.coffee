class window.HandView extends Backbone.View
  className: 'hand'

  #will show a different template whether it's the dealer or not.
  template: _.template '<h2><% if(isDealer){ %>Dealer<% }else{ %>You<% } %> (<span class="score"></span>)</h2>'

  initialize: ->
    @collection.on 'add remove change reset', => @render()
    @render()

  # events:
  #   'click .new-game-button': @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @collection
    @$el.append @collection.map (card) ->
      new CardView(model: card).$el
    @$('.score').text @collection.scores()
 
