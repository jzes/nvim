local keyMapper = require("native.keys")
local tabs = {}


function tabs.setup()
    require("bufferline").setup({
        options = {
            mode = "buffers", -- ou "tabs" se quiser tab real
            diagnostics = "nvim_lsp",
            always_show_bufferline = true,
            separator_style = "slant", -- ou "thin", "padded_slant", etc.
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    })
end

function tabs.setKeys()
    keyMapper.mapNormalModeToBuffer("<S-l>", "<cmd>BufferLineCycleNext<CR>", "Proxima tab")
    keyMapper.mapNormalModeToBuffer("<S-h>", "<cmd>BufferLineCyclePrev<CR>", "Tab anterior")
    keyMapper.mapNormalModeToBuffer(keyMapper.LEADER_KEY .. "c", "<cmd>bd<CR>", "Fecha a tab")
end

return tabs
