local theme = {}

function theme.setMaterial(variant)
    vim.g.material_style = variant
    require("material").setup({
        disable = { background = false },
        contrast = {
            sidebars = true,
            -- floating_windows = true,
            line_numbers = true,
            sign_column = true,
            -- cursor_line = true,
            -- non_current_windows = true,
        },
        -- Você pode adicionar outras configurações aqui, como
        -- lualine_style = "default",
    })
    vim.cmd("colorscheme material")
end

function theme.setDracula()
    vim.cmd("colorscheme dracula")
end

return theme
