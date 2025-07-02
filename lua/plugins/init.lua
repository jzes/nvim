local lsp = require("plugins.lsp")
local ui = require("plugins.ui")
local autoComp = require("plugins.autocomplete")

local completePlugins = {}

vim.list_extend(completePlugins, lsp)
vim.list_extend(completePlugins, ui)
vim.list_extend(completePlugins, autoComp)

return completePlugins
