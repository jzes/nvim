local keyMapper = require("native.keys")

local goLspServer = require("lsp.servers.gopls")
local luaLspServer = require("lsp.servers.luals")
local constants = require("common.consts")

local lsp = {}

function lsp.setKeys(_, bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "d", vim.lsp.buf.definition, "Go to Definition", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "D", vim.lsp.buf.declaration, "Go to Declaration", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "i", vim.lsp.buf.implementation, "Go to Implementation", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "r", vim.lsp.buf.references, "Go to References", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "k",  vim.lsp.buf.hover, "Hover Documentation", bufnr)
    keyMapper.mapNormalModeToBuffer("<C-.>", vim.lsp.buf.signature_help, "Signature Help", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "rn", vim.lsp.buf.rename, "Rename", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "ca", vim.lsp.buf.code_action, "Code Action", bufnr)

    keyMapper.mapNormalModeToBuffer("[d", vim.diagnostic.goto_prev, "Previous Diagnostic", bufnr)
    keyMapper.mapNormalModeToBuffer("]d", vim.diagnostic.goto_next, "Next Diagnostic", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "e", vim.diagnostic.open_float, "Show Diagnostic", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "q", vim.diagnostic.setloclist, "Diagnostics List", bufnr)
end

function lsp.setupServers()
    vim.lsp.skip_setup = {
        gopls = true,
        lua_ls = true,
    }

    local lspconfig = require("lspconfig")

    local servers = {
        [goLspServer.name] = goLspServer.settings,
        [luaLspServer.name] = luaLspServer.settings,
    }

    for name, settings in pairs(servers) do
        settings.on_attach = lsp.setKeys
        lspconfig[name].setup(settings)
    end
end

function lsp.setSigns()
    for type, icon in pairs(constants.signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
end

return lsp
