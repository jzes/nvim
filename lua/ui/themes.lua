local theme = {}

function theme.setMaterial(variant)
    vim.g.material_style = variant
    vim.cmd("colorscheme material")
end

function theme.setDracula()
    vim.cmd("colorscheme dracula")
end

return theme
