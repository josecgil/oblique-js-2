// Generated by CoffeeScript 1.10.0
(function() {
  describe('Oblique Singleton', function() {
    it('must be return same object on new', function() {
      return expect(new Oblique() === new Oblique()).toBeTruthy();
    });
    it('must be used without new', function() {
      return expect(Oblique() === Oblique()).toBeTruthy();
    });
    it('must be return same object calling new Oblique() or Oblique()', function() {
      return expect(Oblique() === new Oblique()).toBeTruthy();
    });
    return it('must return another instance if first called destroy()', function() {
      var firstOblique;
      firstOblique = Oblique();
      firstOblique.destroy();
      return expect(firstOblique === Oblique()).toBeFalsy();
    });
  });

}).call(this);
