local M = {
  ["eslint"] = {
    cmd = { "vscode-eslint-language-server", "--stdio" },

    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
    },

    settings = {
      format = false,
      workingDirectory = { mode = "auto" },
    },
  },
  ["gleam"] = {},
  ["gopls"] = {
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
  },
  ["lua_ls"] = {
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
  },
  ["marksman"] = {
    settings = {
      marksman = {
        filetypes = { "markdown" },
      },
    },
  },
  ["pyright"] = {
    settings = {
      python = {
        analysis = {
          typeCheckingMode = "basic",
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  ["ts_ls"] = {
    settings = {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
      init_options = {
        hostInfo = "neovim",
        preferences = {
          importModuleSpecifierPreference = "relative",
        },
      },
    },
  },
  ["vls"] = {
    settings = {
      cmd = { "vls" },
      filetypes = { "vue" },
    },
  },
  ["rust_analyzer"] = {
    settings = {
      ["rust-analyzer"] = {
        cargo = { allFeatures = true },
        checkOnSave = { command = "clippy" },
      },
    },
  }
}

return M
