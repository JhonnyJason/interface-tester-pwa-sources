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
secUtl = require("secret-manager-crypto-utils")
clientFactory = require("secret-manager-client")

############################################################
cfg = null
network = null
validatableTimestamp = null

############################################################
interfacetestermodule.initialize =  ->
    log "interfacetestermodule.initialize"
    cfg = allModules.configmodule
    network = allModules.networkmodule
    validatableTimestamp = allModules.validatabletimestampmodule

    requestOneButton.addEventListener("click", requestOneButtonClicked)
    requestTwoButton.addEventListener("click", requestTwoButtonClicked)
    requestThreeButton.addEventListener("click", requestThreeButtonClicked)
    return

############################################################
#region internalFunctions
requestOneButtonClicked = ->
    log "requestOneButtonClicked"

    obj = 
        state: "pending Response..."
        request: "one"

    displayObject(obj)
    
    clientPublicKey = cfg.clientPublicKey
    timestamp = validatableTimestamp.create()

    masterKey = cfg.masterSecretKey

    route = "/addClientToServe"
    content = route + JSON.stringify({clientPublicKey, timestamp})
    signature = await secUtl.createSignature(content, masterKey)

    try 
        response = await network.addClientToServe(clientPublicKey, timestamp, signature)
        displayObject(response)
    catch err then displayObject(err.stack)

    return

requestTwoButtonClicked = ->
    log "requesteTwoButtonClicked"
    
    obj = 
        state: "pending Response..."
        request: "two"

    displayObject(obj)

    publicKey = cfg.clientPublicKey
    timestamp = validatableTimestamp.create()
    
    clientSecretKey = cfg.clientSecretKey
    
    route = "/getNodeId"
    content = route + JSON.stringify({publicKey, timestamp})
    signature = await secUtl.createSignature(content, clientSecretKey)

    try 
        response = await network.getNodeId(publicKey, timestamp, signature)
        displayObject(response)
    catch err then displayObject(err.stack)

    return

requestThreeButtonClicked = ->
    log "requestThreeButtonClicked"
    
    obj = 
        state: "pending Response..."
        request: "three"

    displayObject(obj)

    publicKey = cfg.clientPublicKey
    clientSecretKey = cfg.clientSecretKey
    serverURL = "https://secrets.extensivlyon.coffee"
    client = await clientFactory.createClient(clientSecretKey, publicKey, serverURL)
    
    response = await client.startAcceptingSecretsFrom( cfg.serverPublicKey )
    olog { response }

    sessionSeed = await secUtl.createRandomLengthSalt()
    timestamp = validatableTimestamp.create()

    route = "/startSession"
    content = route + JSON.stringify({publicKey, timestamp})
    signature = await secUtl.createSignature(content, clientSecretKey)

    try 
        response = await network.startSession(publicKey, timestamp, signature)
        displayObject(response)
        serverSeed = await client.getSecretFrom("sessionSeed", cfg.serverPublicKey)
        seed = sessionSeed + serverSeed
        authCode = await secUtl.sha256Hex(seed)
        olog { authCode }
        cfg.nextAuthCode = authCode
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