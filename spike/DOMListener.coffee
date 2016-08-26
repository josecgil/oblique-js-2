class DOMListener

  _lastBodyMD5=null

  constructor:->
    @_oblique=Oblique()

    jQuery(document).ready(=>
      @_lastBodyMD5=@_InnerHtmlMD5()
      @_checkDOMChanged()
    )

  _InnerHtmlMD5 : ->
    documentBody = document.body
    return "" if documentBody is null
    return md5(documentBody.innerHTML)

  _checkDOMChanged: ->
    newBodyMD5 = @_InnerHtmlMD5()

    bodyHashChangedSinceLastTime = newBodyMD5 isnt @_lastBodyMD5
    if bodyHashChangedSinceLastTime
      @_oblique.notify(Events.domChanged)
    @_lastBodyMD5=newBodyMD5

    setTimeout(()=>
      @_checkDOMChanged()
    , 200)

window.DOMListener=DOMListener

