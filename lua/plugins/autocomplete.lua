local autocomplete = {}

autocomplete.plugins = {
    {
        "hrsh7th/nvim-cmp",
        -- event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "onsails/lspkind.nvim",
        },
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
    }
}

return autocomplete.plugins
