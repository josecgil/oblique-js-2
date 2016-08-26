describe 'Oblique DOM Ready', ->

  oblique=undefined

  beforeEach ->
    Oblique().destroy()
    oblique=new Oblique()

  fireDOMLoadEvent = ->
    DOMContentLoaded_event = document.createEvent("Event")
    DOMContentLoaded_event.initEvent("DOMContentLoaded", true, true)
    window.document.dispatchEvent(DOMContentLoaded_event)

  it 'must notify on DOM ready', (done)->
    oblique.on(Events.domReady, ->
      done()
    )
    fireDOMLoadEvent()
