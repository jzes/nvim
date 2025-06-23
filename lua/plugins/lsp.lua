local goLspServer = require("lsp.gopls")
local luaLspServer = require("lsp.luals")

local lsp = {}

function lsp.setupServers()
    local lspconfig = require("lspconfig")

    local servers = {
        [goLspServer.name] = goLspServer.settings,
        [luaLspServer.name] = luaLspServer.settings,
    }

    for name, settings in pairs(servers) do
        lspconfig[name].setup(settings)
    end
end

lsp.plugins = {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "neovim/nvim-lspconfig",
        config = lsp.setupServers,
    },
}

return lsp.plugins
