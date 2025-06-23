local lsp = require("plugins.lsp")

local completePlugins = {}

vim.list_extend(completePlugins, lsp)

return completePlugins
