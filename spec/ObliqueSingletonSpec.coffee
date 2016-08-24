describe 'Oblique Singleton', ->

  it 'must be return same object on new', ()->
    expect(new Oblique() is new Oblique()).toBeTruthy()

  it 'must be used without new', ()->
    expect(Oblique() is Oblique()).toBeTruthy()

  it 'must be return same object calling new Oblique() or Oblique()', ()->
    expect(Oblique() is new Oblique()).toBeTruthy()

  it 'must return another instance if first called destroy()', ()->
    firstOblique=Oblique()
    #firstOblique.destroy()
    expect(firstOblique is Oblique()).toBeFalsy()
