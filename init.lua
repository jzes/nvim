local nativeOptions = require("native.options")
local lazyInstaller = require("lazy.installer")
local nativeKeyMapper = require("native.keys")
local lsp = require("lsp.lsp")

local tabs = require("ui.tabs")
local noice = require("ui.noice")
local fzfLua = require("ui.fzflua")
local nvimTree = require("ui.nvimtree")
local luabar = require("ui.luabar")
local theme = require("ui.themes")
local gitsigns = require("ui.gitsigns")
local mini = require("ui.minimap")

local autocomplete = require("autocomp.cmps")
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
    fzfLua.setKeys()
    tabs.setup()
    tabs.setKeys()
    nvimTree.setup()
    noice.setup()
    lsp.setSigns()
    luabar.setup()
    gitsigns.setup()
    mini.setup()
end

local function autoCompConfig()
    autocomplete.setup()
    surround.setup()
    formater.setup()
end

local function main()
    nativeConfig()
    lazyConfig()
    lsp.setupServers()
    uiConfig()
    autoCompConfig()
end

main()
