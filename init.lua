local nativeOptions = require("native.options")
local lazyInstaller = require("lazy.installer")
local nativeKeyMapper = require("native.keys")
local lsp = require("lsp.lsp")

local tabs = require("ui.tabs")
local noice = require("ui.noice")
local fzfLua = require("ui.fzflua")
local nvimTree = require("ui.nvimtree")
local luabar = require("ui.luabar")

local autocomplete = require("autocomp.cmps")
local surround = require("autocomp.surround")

local function nativeConfig()
    nativeKeyMapper.map()
    nativeOptions.setup()
end

local function lazyConfig()
    lazyInstaller.ensureInstall()
    lazyInstaller.setupPlugins()
end

local function uiConfig()
    fzfLua.setKeys()
    tabs.setup()
    tabs.setKeys()
    nvimTree.setup()
    noice.setup()
    lsp.setSigns()
    luabar.setup()
end

local function autoCompConfig()
    autocomplete.setup()
    surround.setup()
end

local function main()
    nativeConfig()
    lazyConfig()
    lsp.setupServers()
    uiConfig()
    autoCompConfig()
end

main()
