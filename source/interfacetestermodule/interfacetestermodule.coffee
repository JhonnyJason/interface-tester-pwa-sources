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
network = null

############################################################
interfacetestermodule.initialize = () ->
    log "interfacetestermodule.initialize"
    network = allModules.networkmodule
    requestOneButton.addEventListener("click", requestOneButtonClicked)
    requestTwoButton.addEventListener("click", requestTwoButtonClicked)
    return

############################################################
#region internalFunctions
requestOneButtonClicked = ->
    log "requestOneButtonClicked"

    obj = 
        state: "pending Response..."
        request: "one"

    displayObject(obj)
    
    try 
        response = await network.getResponse("asd", "moredata")
        displayObject(response)
    catch err then displayObject(err.stack)

    return

requestTwoButtonClicked = ->
    log "requesteTwoButtonClicked"
    
    obj = 
        state: "pending Response..."
        request: "two"

    displayObject(obj)

    try 
        response = await network.getProxyResponse("dsa", "lessdata")
        displayObject(response)
    catch err then displayObject(err.stack)

    return

############################################################
displayObject = (obj) ->
    rendered = JSON.stringify(obj, null, 4)
    rendered = rendered.replace(/\n/g, "<br/>")
    rendered = rendered.replace(/\s/g, "_")    
    display(rendered)
    return

display = (renderedData) ->
    interfacetesterResponseDisplay.innerHTML = renderedData
    return

#endregion
    
module.exports = interfacetestermodule