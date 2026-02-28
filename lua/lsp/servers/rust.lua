local M = {}

M.name = "rust_analyzer"

M.settings = {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
}
return M
