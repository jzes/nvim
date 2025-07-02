local ui = {}

ui.plugins = {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {}
    },
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        "akinsho/bufferline.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        event = "VeryLazy",
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
            "stevearc/dressing.nvim",
        },
    }
}

return ui.plugins
