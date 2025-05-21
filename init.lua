require("installer").install()

local configer = require("configer")
local fzf = require("fzf")
local keyset = require("keyset")
local telescoper = require("telescoper")
local formater = require("formater")
local catppucciner = require("catppucciner")
local bufferliner = require("bufferliner")
local lualiner = require("lualiner")
local toggle_termer = require("toggle_termer")
local tree = require("tree")
local lspconfiger = require("lspconfiger")
local cmp = require("cmp")
local autocompleter = require("autocompleter")
local noicer = require("noicer")

configer.config_basic()
configer.config_style()
configer.config_gen()
configer.build_commands()

fzf.configure()
telescoper.config()

formater.set_json_formater()
formater.set_markdown_formater()

catppucciner.config()

vim.ui.select = require('dropbar.utils.menu').select
require('Comment').setup()

bufferliner.config()
lualiner.config()
toggle_termer.config()
tree.config()

keyset.set()
lspconfiger.config(keyset.on_attach)
autocompleter.config(cmp)
noicer.config()

require("mini.map").setup({
  integrations = {
    require("mini.map").gen_integration.diagnostic({
      error = "DiagnosticSignError",
      warn  = "DiagnosticSignWarn",
      info  = "DiagnosticSignInfo",
      hint  = "DiagnosticSignHint",
    }),
  },
  symbols = { encode = require("mini.map").gen_encode_symbols.dot("4x2") },
  window = { width = 10, focusable = false }
})
require("mini.map").open()

vim.opt.guicursor = {
  "n-v-c:block-Cursor",     -- normal, visual, command: bloco
  "i-ci-ve:ver25-CursorInsert", -- insert, insert-command, visual-ex (linha vertical)
  "r-cr:hor20-CursorReplace",   -- replace modes
}



-- require('telescope.builtin').colorscheme({
--   default_text = "onedark", -- Define o texto inicial da busca
--   -- enable_preview = true -- Geralmente já é true por padrão para este picker
-- })
-- vim.cmd('colorscheme onedark')
-- vim.o.background = "light" -- or "light" for light mode
-- vim.cmd('colorscheme gruvbox')
-- Defina as cores do cursor
vim.cmd [[
  highlight Cursor guifg=#1e1e2e guibg=#f38ba8
  highlight CursorInsert guifg=#1e1e2e guibg=#a6e3a1
  highlight CursorReplace guifg=#1e1e2e guibg=#f9e2af
]]
