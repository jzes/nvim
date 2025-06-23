local nativeOptions = require("native.options")
local lazyInstaller = require("lazy.installer")

local function main()
    nativeOptions.setup()
    lazyInstaller.ensureInstall()
    lazyInstaller.setupPlugins()
end

vim.lsp.skip_setup = {
  gopls = true,
  lua_ls = true,
}

main()
