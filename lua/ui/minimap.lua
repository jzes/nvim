local mini = {}

function mini.setup()
    local map = require("mini.map")
    map.setup({
        integrations = {
            map.gen_integration.builtin_search(),
            map.gen_integration.gitsigns(),
            map.gen_integration.diagnostic(),
        },
        symbols = {
            encode = map.gen_encode_symbols.dot("3x2"),
            scroll_line = "󱞪",
            scroll_view = "▎",
            -- scroll_line = "",
            -- scroll_view = "┃"
        },
        window = {
            side = "right",
            width = 15,
            winblend = 25,
            show_integration_count = false,
        },
    })
    -- Atalho para alternar a visibilidade
    vim.keymap.set("n", "<leader>mm", map.toggle, { desc = "Toggle minimap" })
end

return mini
