
local noice = {}

function noice.setup()
    require("noice").setup({
        lsp = {
            hover = { enabled = true },
            signature = { enabled = true },
            message = { enabled = true },
        },
        presets = {
            command_palette = true,
            lsp_doc_border = true,
            long_message_to_split = true,
            inc_rename = false,
            bottom_search = true,
        },
    })

    vim.notify = require("notify")
end

return noice
