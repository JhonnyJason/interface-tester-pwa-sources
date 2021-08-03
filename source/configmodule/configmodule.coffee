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
configmodule.clientSecretKey = "b964dfab0b7d9fe43022e9584fd782f83e5fab11bb1a409464f5fbdebc62df6f"
configmodule.clientPublicKey = "cab958a8f0402ebf305535935da74f756a685adb6db9bb15257a64389f641a35"

configmodule.masterSecretKey = "003464606f47e65cf514c2c8f1f007d432a46fbeba616781bbff52def803e6e8"
configmodule.masterPublicKey = "7102da6282ec316974e7ea6ad7d24bd077f70a969ffe865c8b99b12b314f644c"

configmodule.serverSecretKey = "447dd15e1d5ded3d662c26e0e61bf299ccab60b2d4bc86f1ec07e4561a09df63"
configmodule.serverPublicKey = "dc29860abee9d5783d1689ef249f0d3aa18bda443a524ae610e3c3f71c6b5bca"

configmodule.timestampFrameMS = 10000

configmodule.interfaceServers = 
    authenticationinterface: "https://localhost:6999"

#endregion

export default configmodule
