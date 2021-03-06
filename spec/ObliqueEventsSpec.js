// Generated by CoffeeScript 1.10.0
(function() {
  describe('Oblique Events', function() {
    var oblique;
    oblique = void 0;
    beforeEach(function() {
      Oblique().destroy();
      return oblique = new Oblique();
    });
    it('must notify a subscriber on trigger', function(done) {
      var eventHandler, eventName;
      eventName = "oblique.event-name";
      eventHandler = function() {
        return done();
      };
      oblique.on(eventName, eventHandler);
      return oblique.notify(eventName);
    });
    it('must not call my listener if notified event is not mine', function(done) {
      var eventHandler, eventName;
      eventName = "oblique.event-name";
      eventHandler = function() {
        return fail("my event handler was called");
      };
      oblique.on(eventName, eventHandler);
      oblique.notify("oblique.other-event");
      return setTimeout(function() {
        return done();
      }, 200);
    });
    it('must pass my data to a listener', function(done) {
      var eventData, eventHandler, eventName;
      eventData = ["someData"];
      eventName = "oblique.event-name";
      eventHandler = function(eventDataFromBus) {
        expect(eventDataFromBus).toEqual(eventData);
        return done();
      };
      oblique.on(eventName, eventHandler);
      return oblique.notify(eventName, eventData);
    });
    return it("must pass undefined as data if I don't send it in notify", function(done) {
      var eventHandler, eventName;
      eventName = "oblique.event-name";
      eventHandler = function(eventDataFromBus) {
        expect(eventDataFromBus).toBeUndefined();
        return done();
      };
      oblique.on(eventName, eventHandler);
      return oblique.notify(eventName);
    });
  });

}).call(this);
