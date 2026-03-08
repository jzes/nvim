local nativeOptions = require("core.options")
local lazyInstaller = require("lazy.installer")
local nativeKeyMapper = require("core.keys")
local lsp = require("intellisense.lsp.lsp")

local theme = require("ui.themes")
local ui = require("ui.ui")

local autocomplete = require("autocomp.cmps")
local cursor_highlight = require("autocmd.cursor_highlight")
local yank_highlight = require("autocmd.highlight_yank")
local surround = require("autocomp.surround")
local formater = require("autocomp.formater")

local function nativeConfig()
  nativeKeyMapper.map()
  nativeOptions.setup()
end

local function lazyConfig()
  lazyInstaller.ensureInstall()
  lazyInstaller.setupPlugins()
end

local function uiConfig()
  theme.setMaterial("palenight")
  -- theme.setCyberdream()
  -- theme.setGruvboxDarkHard()
  -- theme.setKanagawa()
  -- theme.setOnedarkpro()
  -- theme.setTokyonight()
  -- theme.setDracula()
  -- fzfLua.setKeys()
  ui.set_signs(ui.default_signs)
end

local function autoCompConfig()
  autocomplete.setup()
  surround.setup()
  formater.setup()
end

local function autocmdConfig()
  cursor_highlight.setCursorHighlight()

  cursor_highlight.setCursorHighlight()
  yank_highlight.setHighlightYank()
end

local function main()
  nativeConfig()
  lazyConfig()
  lsp.setup_servers()
  uiConfig()
  autoCompConfig()
  autocmdConfig()

  vim.opt.exrc = true
  vim.opt.secure = false
end

main()
