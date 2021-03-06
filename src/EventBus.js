// Generated by CoffeeScript 1.10.0
(function() {
  this.EventBus = (function() {
    function EventBus() {
      this._listenersByEventName = {};
    }

    EventBus.prototype.on = function(eventName, eventHandler) {
      var listeners;
      listeners = this._listenersByEventName[eventName];
      if (listeners === void 0) {
        listeners = [];
        this._listenersByEventName[eventName] = listeners;
      }
      return listeners.push(eventHandler);
    };

    EventBus.prototype.notify = function(eventName, eventData) {
      var i, len, listener, listeners, results;
      listeners = this._listenersByEventName[eventName];
      if (listeners === void 0) {
        return;
      }
      results = [];
      for (i = 0, len = listeners.length; i < len; i++) {
        listener = listeners[i];
        results.push(listener(eventData));
      }
      return results;
    };

    return EventBus;

  })();

}).call(this);
