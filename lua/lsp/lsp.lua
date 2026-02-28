local key_binder = require("lsp.keybindings")
local servers = require("lsp.servers")
local constants = require("common.consts")

local lsp = {}

function lsp.on_atach(client, bufnr)
  if client.name == "tsserver" or client.name == "ts_ls" or client.name == "tsls" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

  key_binder.set_keybindings(key_binder.keybindings, bufnr)
end

function lsp.setupServers()
  vim.lsp.skip_setup = {
    gopls = true,
    lua_ls = true,
  }

  local lspconfig = require("lspconfig")

  for name, settings in pairs(servers) do
    settings.on_attach = lsp.on_atach
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
