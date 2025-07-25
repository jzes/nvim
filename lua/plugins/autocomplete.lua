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
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
    },
    {
        "nvim-treesitter/nvim-treesitter",
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    }
}

return autocomplete.plugins
