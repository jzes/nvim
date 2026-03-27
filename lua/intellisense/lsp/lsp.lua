local key_binder = require("intellisense.lsp.keybindings")
local servers = require("intellisense.lsp.servers")

local lsp = {}

function lsp.on_atach(client, bufnr)
  servers.disable_formatters(servers.disabled_formatter_servers, client)
  key_binder.set_keybindings(key_binder.keybindings, bufnr)
end

function lsp.setup_servers()
  for name, settings in pairs(servers.configs) do
    settings.on_attach = lsp.on_atach
    vim.lsp.config(name, settings)
    vim.lsp.enable(name)
  end
end

return lsp
