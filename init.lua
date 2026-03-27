local nativeOptions = require("core.options")
local lazyInstaller = require("lazy.installer")
local nativeKeyMapper = require("common.keys")
local lsp = require("intellisense.lsp.lsp")
local theme = require("ui.themes")
local ui = require("ui.ui")
local autocomplete = require("editor.auto_complete")

local function nativeConfig()
  nativeKeyMapper.map()
  nativeOptions.setup()
end

local function lazyConfig()
  lazyInstaller.ensureInstall()
  lazyInstaller.setupPlugins()
end

local function set_theme()
  -- theme.set_material("palenight")
  -- theme.setCyberdream()
  -- theme.setGruvboxDarkHard()
  -- theme.setKanagawa()
  -- theme.setOnedarkpro()
  theme.setTokyonight()
  -- theme.setDracula()
end

local function main()
  nativeConfig()
  lazyConfig()
  lsp.setup_servers()
  set_theme()
  autocomplete.setup()
  ui.set_signs(ui.default_signs)
  ui.set_cursor_highlight()
  ui.set_highlight_yank()

  vim.opt.exrc = true
  vim.opt.secure = false
end

main()
