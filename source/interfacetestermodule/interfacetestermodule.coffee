interfacetestermodule = {name: "interfacetestermodule"}
############################################################
#region printLogFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["interfacetestermodule"]?  then console.log "[interfacetestermodule]: " + arg
    return
ostr = (obj) -> JSON.stringify(obj, null, 4)
olog = (obj) -> log "\n" + ostr(obj)
print = (arg) -> console.log(arg)
#endregion

############################################################
interfacetestermodule.initialize = () ->
    log "interfacetestermodule.initialize"
    requestOneButton.addEventListener("click", requestOneButtonClicked)
    requestTwoButton.addEventListener("click", requestTwoButtonClicked)
    return

############################################################
#region internalFunctions
requestOneButtonClicked = ->
    log "requestOneButtonClicked"
    return

requesteTwoButtonClicked = ->
    log "requesteTwoButtonClicked"
    return

#endregion
    
module.exports = interfacetestermodule