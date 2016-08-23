class DOMReady

  ready= () ->
    Oblique().notify "ready.ob.dom"

  completed =() ->
    document.removeEventListener 'DOMContentLoaded', completed
    window.removeEventListener 'load', completed
    ready()

  constructor:()->
    if document.readyState is 'complete' or document.readyState isnt 'loading' and (not document.documentElement.doScroll)
      setTimeout(->
        ready()
      , 0)
      return

    document.addEventListener 'DOMContentLoaded', completed
    window.addEventListener 'load', completed

window.DOMReady=DOMReady