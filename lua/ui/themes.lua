local theme = {}

function theme.set_material(variant)
  vim.g.material_style = variant
  require("material").setup({
    -- disable = { background = false },
    contrast = {
      sidebars = true,
      -- floating_windows = true,
      line_numbers = true,
      sign_column = true,
      cursor_line = true,
      lsp_virtual_text = true,
      -- non_current_windows = true,
    },
    styles = {
      comments = { italic = true },
      functions = { bold = true },
    },
    -- plugins = { "noice" },
    custom_highlights = {
      -- Aqui você define a cor do Visual Mode
      -- bg = Cor de fundo (Background)
      -- fg = Cor da letra (Foreground) - opcional  teste de fg pra seleção #cfb8de
      Visual = { bg = "#664e79", fg = "NONE", bold = true },
    }
    -- Você pode adicionar outras configurações aqui, como
    -- lualine_style = "default",
  })
  vim.cmd("colorscheme material")
end

function theme.setDracula()
  vim.cmd("colorscheme dracula")
end

function theme.setCyberdream()
  vim.cmd("colorscheme cyberdream")
end

function theme.setGruvboxDarkHard()
  require("gruvbox").setup({
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    inverse = true,    -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
  })
  vim.cmd("colorscheme gruvbox")
  vim.g.gruvbox_contrast_dark = "hard"
end

function theme.setKanagawa()
  require("kanagawa").setup({
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,
    specialException = true,
    transparent = false,
    dimInactive = false,
    globalStatus = false,
    terminalColors = true,
    colors = {
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
    overrides = function(colors)
      local themeColors = colors.theme
      return {
        -- Customize normal background
        NormalFloat = { bg = themeColors.bg_dim },
        FloatBorder = { bg = themeColors.bg_dim, fg = themeColors.fg_dim },
      }
    end,
  })
  vim.cmd("colorscheme kanagawa")
end

function theme.setOnedarkpro()
  vim.cmd("colorscheme onedark")
end

function theme.setTokyonight()
  vim.cmd("colorscheme tokyonight")
end

return theme
