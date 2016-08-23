describe 'Oblique Events', ->

  oblique=undefined

  beforeEach ->
    Oblique().destroy()
    oblique=new Oblique();

  it 'must notify a subscriber on trigger', (done)->
    eventName="oblique.event-name"
    eventHandler=->
      done()

    oblique.on(eventName, eventHandler)

    oblique.notify(eventName)

  it 'must not call my listener if notified event is not mine', (done)->
    eventName="oblique.event-name"
    eventHandler=->
      fail("my event handler was called")

    oblique.on(eventName, eventHandler)

    oblique.notify("oblique.other-event")
    setTimeout(->
      done()
    , 200)

  it 'must pass my data to a listener', (done)->
    eventData=["someData"]
    eventName="oblique.event-name"

    eventHandler=(eventDataFromBus)->
      expect(eventDataFromBus).toEqual(eventData)
      done()

    oblique.on(eventName, eventHandler)

    oblique.notify(eventName, eventData)

  it "must pass undefined as data if I don't send it in notify", (done)->
    eventName="oblique.event-name"

    eventHandler=(eventDataFromBus)->
      expect(eventDataFromBus).toBeUndefined()
      done()

    oblique.on(eventName, eventHandler)

    oblique.notify(eventName)
