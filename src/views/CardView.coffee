class window.CardView extends Backbone.View
  className: 'card'

  #to make sure deck collection cards correspond to the right image card, in the template
  #properties on cards to correspond with image name;
  template: _.template '<img src="img/cards/<%= rankName %>-<%= suitName %>.png">'

  template2: _.template '<img src="img/card-back.png">'

  initialize: -> 
    @render()

  render: ->
    @$el.children().detach()
    if @model.get('revealed')
    then @$el.html @template @model.attributes
    else @$el.html @template2 @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

