local installer = {}

local function isInstalled(path)
    return vim.loop.fs_stat(path) ~= nil
end

local function addToNvimRuntime(path)
    vim.opt.rtp:prepend(path)
end

local function download(path)
    vim.fn.system({
       "git",
       "clone",
       "--filter=blob:none",
       "https://github.com/folke/lazy.nvim.git",
       "--branch=stable",
       path,
    })
end

local function isInRuntime(targetPath)
    local runtimePaths = vim.opt.rtp:get()

    for _, runtimePath in ipairs(runtimePaths) do
        if targetPath == runtimePath then
            return true
        end
    end

    return false
end

function installer.ensureInstall()
    lazyPath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

    if not isInstalled(lazyPath) then
        download(lazyPath) 
    end

    if not isInRuntime(lazyPath) then
        addToNvimRuntime(lazyPath)
    end
end

function installer.setupPlugins()
    require("lazy").setup("plugins")
end

return installer

