import Modules from "./allmodules"
import domconnect from "./indexdomconnect"

global.allModules = Modules


window.onload = ->
    domconnect.initialize()
    promises = (m.initialize() for n,m of Modules when m.initialize?)
    await Promise.all(promises)
    appStartup()


appStartup = ->
    ## which modules shall be kickstarted?
    return
