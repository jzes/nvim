local lsp = require("plugins.lsp")
local ui = require("plugins.ui")
local themes = require("plugins.themes")
local autoComp = require("plugins.autocomplete")

local completePlugins = {}

vim.list_extend(completePlugins, lsp)
vim.list_extend(completePlugins, ui)
vim.list_extend(completePlugins, autoComp)
vim.list_extend(completePlugins, themes)

return completePlugins
