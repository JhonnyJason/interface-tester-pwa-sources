configmodule = {name: "configmodule", uimodule: false}

#region logPrintFunctions
log = (arg) ->
    if allModules.debugmodule.modulesToDebug["configmodule"]?  then console.log "[configmodule]: " + arg
    return
#endregion
########################################################
configmodule.initialize = () ->
    log "configmodule.initialize"
    return    

#region exposedProperties
configmodule.interfaceServers = 
    sampleinterface: "https://localhost:6767"

#endregion

export default configmodule
