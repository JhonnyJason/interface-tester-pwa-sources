indexdomconnect = {name: "indexdomconnect"}

############################################################
indexdomconnect.initialize = () ->
    global.requestOneButton = document.getElementById("request-one-button")
    global.requestTwoButton = document.getElementById("request-two-button")
    global.interfacetesterResponseDisplay = document.getElementById("interfacetester-response-display")
    return
    
module.exports = indexdomconnect