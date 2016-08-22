class DOMListener

  _lastBodyMD5=null

  constructor:->
    @_EventBus=new EventBus()

    jQuery(document).ready(=>
      @_lastBodyMD5=@_InnerHtmlMD5()
      @_checkDOMChanged()
      @_EventBus.notify("oblique.dom_ready")
    )

  _InnerHtmlMD5 : ->
    documentBody = document.body
    return "" if documentBody is null
    return md5(documentBody.innerHTML)

  _checkDOMChanged: ->
    newBodyMD5 = @_InnerHtmlMD5()

    bodyHashChangedSinceLastTime = newBodyMD5 isnt @_lastBodyMD5
    if bodyHashChangedSinceLastTime
      @_EventBus.notify("oblique.dom_changed")
    @_lastBodyMD5=newBodyMD5

    setTimeout(()=>
      @_checkDOMChanged()
    , 200)

  on:(eventName, eventHandler)->
    @_EventBus.on eventName, eventHandler

window.DOMListener=DOMListener
