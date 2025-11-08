local keyMapper = require("native.keys")

local goLspServer = require("lsp.servers.gopls")
local luaLspServer = require("lsp.servers.luals")
local constants = require("common.consts")
local tsLspServer = require("lsp.servers.tsls")
local pyright = require("lsp.servers.pyright")
local vueLspServer = require("lsp.servers.vls")
local markdownLspServer = require("lsp.servers.markdown")

local lsp = {}

function lsp.setKeys(_, bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "d", "<CMD>FzfLua lsp_definitions<CR>", "Go to Definition",
        bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "D", vim.lsp.buf.declaration, "Go to Declaration", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "i", "<CMD>FzfLua lsp_implementations<CR>",
        "Go to Implementation",
        bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "r", "<CMD>FzfLua lsp_references<CR>", "Go to References",
        bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "k", vim.lsp.buf.hover, "Hover Documentation", bufnr)
    keyMapper.mapNormalModeToBuffer("<C-.>", vim.lsp.buf.signature_help, "Signature Help", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "rn", vim.lsp.buf.rename, "Rename", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "ca", vim.lsp.buf.code_action, "Code Action", bufnr)

    keyMapper.mapNormalModeToBuffer("[d", vim.diagnostic.goto_prev, "Previous Diagnostic", bufnr)
    keyMapper.mapNormalModeToBuffer("]d", vim.diagnostic.goto_next, "Next Diagnostic", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "e", vim.diagnostic.open_float, "Show Diagnostic", bufnr)
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "q", vim.diagnostic.setloclist, "Diagnostics List", bufnr)
end

function lsp.setCommands()
    vim.api.nvim_create_autocmd('CursorHold', {
        callback = function()
            vim.lsp.buf.document_highlight()
        end,
    })

    -- Autocomando para limpar o destaque quando o cursor se move.
    vim.api.nvim_create_autocmd('CursorMoved', {
        callback = function()
            vim.lsp.buf.clear_references()
        end,
    })
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
        [tsLspServer.name] = tsLspServer.settings,
        [pyright.name] = pyright.settings,
        [vueLspServer.name] = vueLspServer.settings,
        [markdownLspServer.name] = markdownLspServer.settings,
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
