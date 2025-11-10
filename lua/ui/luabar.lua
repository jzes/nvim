local luabar = {}

luabar.options = {
    theme = "auto", -- usa o tema atual do Neovim (ou pode usar "catppuccin", "tokyonight", etc.)
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    icons_enabled = true,
    globalstatus = true, -- barra única no final da tela
}

luabar.sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
}

function luabar.setup()
    require("lualine").setup({
        options = luabar.options,
        sections = luabar.sections,
    })
end

return luabar
