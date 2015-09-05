// Generated by CoffeeScript 1.10.0
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

window.AppView = (function(superClass) {
  extend(AppView, superClass);

  function AppView() {
    return AppView.__super__.constructor.apply(this, arguments);
  }

  AppView.prototype.template = _.template('<button class="hit-button">Hit</button> <button class="stand-button">Stand</button> <button class="new-game-button">NEW GAME</button> <div class="player-hand-container"></div> <div class="dealer-hand-container"></div>');

  AppView.prototype.events = {
    'click .new-game-button': function() {
      return this.model.reset();
    },
    'click .hit-button': function() {
      return this.model.get('playerHand').hit();
    },
    'click .stand-button': function() {
      return this.model.get('dealerHand').stand();
    }
  };

  AppView.prototype.initialize = function() {
    this.model.on('change', (function(_this) {
      return function() {
        return _this.displayWinner();
      };
    })(this));
    return this.render();
  };

  AppView.prototype.displayWinner = function() {
    return this.$el.append("<div class='winMessage'>" + this.model.get('winnerMessage') + "</div>");
  };

  AppView.prototype.render = function() {
    this.$el.children().detach();
    this.$el.html(this.template());
    this.$('.player-hand-container').html(new HandView({
      collection: this.model.get('playerHand')
    }).el);
    return this.$('.dealer-hand-container').html(new HandView({
      collection: this.model.get('dealerHand')
    }).el);
  };

  return AppView;

})(Backbone.View);
