goLspServer = {}

goLspServer.settings = {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
                nilness = true,
                unusedwrite = true,
            },
            staticcheck = true,
        },
    }
}

goLspServer.name = "gopls"

return goLspServer
