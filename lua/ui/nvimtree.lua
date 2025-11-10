local nvimTree = {}

function nvimTree.setup()
    require("nvim-tree").setup({
        view = {
            width = 35,
            preserve_window_proportions = true,
        },
        filters = {
            dotfiles = false,
        },
        update_focused_file = {
            enable = true,
        },
        renderer = {
            icons = {
                show = {
                    file = true,
                    folder = true,
                    folder_arrow = true,
                },
            },
        },
        diagnostics = {
    enable = true,
    show_on_dirs = true,        -- mostra nos diretórios também
    show_on_open_dirs = false,  -- opcional: só mostra se a pasta estiver aberta
    debounce_delay = 50,
    severity = {
      min = vim.diagnostic.severity.HINT,
      max = vim.diagnostic.severity.ERROR,
    },
  },
    })
end

return nvimTree
