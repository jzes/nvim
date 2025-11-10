local lsp = {}

lsp.plugins = {
    {
        "williamboman/mason.nvim",
        config = true,
    },
    {
        "neovim/nvim-lspconfig",
    },
}

return lsp.plugins
