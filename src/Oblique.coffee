class Oblique

  constructor:()->
    return new Oblique() if @ is window
    return Oblique._singletonInstance if Oblique._singletonInstance
    Oblique._singletonInstance = @

    @_EventBus=new EventBus()

  on : (eventName, eventHandler) ->
    @_EventBus.on eventName, eventHandler

  notify : (eventName, eventData) ->
    @_EventBus.notify eventName, eventData

  destroy: ->
    Oblique._singletonInstance=undefined

window.Oblique=Oblique