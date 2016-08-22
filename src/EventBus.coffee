class EventBus
  constructor: () ->
    @_listenersByEventName={}

  on : (eventName, eventHandler) ->
    listeners=@_listenersByEventName[eventName]

    if listeners is undefined
      listeners=[]
      @_listenersByEventName[eventName]=listeners

    listeners.push eventHandler

  notify : (eventName, eventData) ->
    listeners=@_listenersByEventName[eventName]
    return if listeners is undefined
    for listener in listeners
      listener(eventData)

window.EventBus=EventBus