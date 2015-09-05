class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png">'

  template2: _.template '<img src="img/card-back2.png">'

  initialize: -> 
    @render()

  render: ->
    @$el.children().detach()
    if @model.get('revealed')
    then @$el.html @template @model.attributes
    else @$el.html @template2 @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

