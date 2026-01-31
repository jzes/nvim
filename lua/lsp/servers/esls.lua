local esserver = {}

esserver.name = "eslint"

esserver.settings = {
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
}

return esserver
