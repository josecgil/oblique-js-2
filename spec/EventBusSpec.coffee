describe 'Event Bus', ->

  it 'must subscribe a listener', (done)->
    eventBus=new EventBus();
    eventName="oblique.event-name"
    eventHandler=->
      done()

    eventBus.on(eventName, eventHandler)

    eventBus.notify(eventName)

  it 'must not call my listener if notified event is not mine', (done)->
    eventBus=new EventBus();
    eventName="oblique.event-name"
    eventHandler=->
      fail("my event handler was called")

    eventBus.on(eventName, eventHandler)

    eventBus.notify("oblique.otherEvent")
    setTimeout(->
      done()
    , 200)

  it 'must pass my data to a listener', (done)->
    eventBus=new EventBus();
    eventData=["someData"]
    eventName="oblique.event-name"

    eventHandler=(eventDataFromBus)->
      expect(eventDataFromBus).toEqual(eventData)
      done()

    eventBus.on(eventName, eventHandler)

    eventBus.notify(eventName, eventData)
