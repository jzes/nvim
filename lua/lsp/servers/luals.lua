goLspServer = {}

goLspServer.settings = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT", -- Usado pelo Neovim
          path = vim.split(package.path, ";"),
        },
        diagnostics = {
          globals = { "vim" }, -- Ignora erro "undefined global 'vim'"
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false, -- Evita prompt "configure third-party..."
        },
        telemetry = {
          enable = false,
        },
        completion = {
          callSnippet = "Replace",
        },
      },
    },
  }
goLspServer.name = "lua_ls"

return goLspServer
