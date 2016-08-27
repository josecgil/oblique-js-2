class @DOMReadyListener

  addDocumentLoadEventListener = ->
    document.addEventListener 'DOMContentLoaded', completed
    window.addEventListener 'load', completed

  removeDocumentLoadEventListener = ->
    document.removeEventListener 'DOMContentLoaded', completed
    window.removeEventListener 'load', completed

  ready= () ->
    setTimeout(->
      Oblique().notify "ready.ob.dom"
    , 0)

  completed =() ->
    ready()
    removeDocumentLoadEventListener()

  constructor:()->
    if @documentIsReady()
      ready()
      return

    addDocumentLoadEventListener()


  documentIsReady : ->
    readyState = document.readyState
    isScrolling = document.documentElement.doScroll
    isComplete=readyState is 'complete'
    isLoading=readyState is 'loading'
    return true if isComplete
    return true if (not isLoading) and (not isScrolling)
    return false
