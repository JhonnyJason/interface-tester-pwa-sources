sampleinterface = {}

############################################################
sampleinterface.getResponse = (id, data) ->
    requestObject = {id, data}
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["sampleinterface"]+"/getResponse"
    return @postData(requestURL, requestObject)

sampleinterface.getProxyResponse = (id, data)->
    requestObject = {id, data}
    interfaceServers = allModules.configmodule.interfaceServers
    requestURL = interfaceServers["sampleinterface"]+"/getProxyResponse"
    return @postData(requestURL, requestObject)

#endregion

    
module.exports = sampleinterface