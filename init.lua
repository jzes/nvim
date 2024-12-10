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

configer.config_basic()
configer.config_style()
configer.config_gen()

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

-- require('noice').setup({
-- 	cmdline = {
--     enabled = true, -- Habilitar a interface para a linha de comando
--   },
--   messages = {
--     enabled = true, -- Habilitar substituição de mensagens
--   },
--   lsp = {
--     override = {
--       -- Intercepta mensagens de progresso e substitui pela interface do Noice
--       ["coc.showMessage"] = true,
--     },
--   },
--   routes = {
--     -- Redireciona mensagens específicas do Coc para o Noice
--     {
--       filter = { event = "msg_show", find = "Coc" },
--       opts = { skip = true },
--     },
--   },
-- })

