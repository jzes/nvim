local builtin = require("telescope.builtin")
local entry_display = require("telescope.pickers.entry_display")

local telescoper = {}

function telescoper.config()
	require("telescope").load_extension('live_grep_args')
	-- require("telescope").load_extension('fzf')
	require("telescope").setup({
		defaults = {
			truncate = false,
			layout_strategy = "horizontal",
			layout_config = {
				width = 0.8,
			},
		}
	})
end

function telescoper.custom_lsp_references(opts)
  opts = opts or {}

  local displayer = entry_display.create({
    separator = " │ ",
    items = {
      { width = 80 }, -- Nome do arquivo
      { width = 5 },  -- Linha
      { remaining = true }, -- Conteúdo
    },
  })

  opts.entry_maker = function(entry)
	local win_width = vim.api.nvim_win_get_width(0)
  	local max_path_len = math.floor(win_width * 0.4) -- usa 40% da largura da janela, ajuste como quiser

  	-- Pega o caminho relativo
  	local path = vim.fn.fnamemodify(entry.filename, ":~:.")

	if #path > max_path_len then
    	path = "…" .. string.sub(path, -max_path_len + 1)
  	end

    return {
      value = entry,
      ordinal = path .. " " .. entry.lnum .. " " .. entry.text,
      display = function()
        return displayer({
          path,
          tostring(entry.lnum),
          entry.text,
        })
      end,
      filename = path,
      lnum = entry.lnum,
      col = entry.col,
      text = entry.text,
      bufnr = entry.bufnr,
    }
  end

  builtin.lsp_references(opts)
end

return telescoper
