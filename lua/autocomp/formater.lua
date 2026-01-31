local formater = {}

function formater.setup()
  require("conform").setup({
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true, -- usa LSP se não houver formatter configurado
    },
    formatters_by_ft = {
      go = { "goimports", "gofmt" },
      -- lua = { "stylua" },
      python = { "black" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      json = { "prettier" },
      yaml = { "prettier" },
      markdown = { "prettier" },
    },
  })
end

function formater.setup_none_ls()
  local null_ls = require("null-ls")

  null_ls.setup({
    sources = {
      null_ls.builtins.formatting.prettier.with({
        prefer_local = "node_modules/.bin",
      }),

      null_ls.builtins.diagnostics.eslint.with({
        prefer_local = "node_modules/.bin",
      }),

      null_ls.builtins.code_actions.eslint.with({
        prefer_local = "node_modules/.bin",
      }),
    },
  })
end

return formater
