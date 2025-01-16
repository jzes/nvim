local buffercloser = require("buffercloser")

local configer = {}

function configer.config_basic()

	vim.cmd([[
		set number
		set cursorline
		set guicursor=i:ver25-iCursor
		set hidden
	  	set tabstop=4
	  	set shiftwidth=4
	  	set signcolumn=yes:2
	  	set undofile
	  	set wildmode=longest:full,full
	  	set title
	  	set nowrap
	  	set mouse=a
	  	set scrolloff=8
	  	set sidescrolloff=8
	  	set nojoinspaces
	  	set clipboard=unnamed,unnamedplus
	  	set confirm
	]])
end

function configer.config_style()
	vim.cmd([[
		set smartcase
		set ignorecase 
		highlight Normal guibg=none
        highlight NonText guibg=none
        highlight Normal ctermbg=none
        highlight NonText ctermbg=none
		set termguicolors
	]])
end

function configer.config_gen()
	vim.opt.backup = false
	vim.opt.writebackup = false
	-- Tempo de update mais curto pra melhorar a experiência
	vim.opt.updatetime = 300
	-- Always show the signcolumn, otherwise it would shift the text each time
	-- diagnostics appeared/became resolved
	-- ???
	vim.opt.signcolumn = "yes"
end

function configer.build_commands()
	vim.api.nvim_create_user_command(
	  'Rename',
	  function()
		vim.lsp.buf.rename()
	  end,
	  { desc = "-> LSP Rename Symbol" }
	)
	vim.api.nvim_create_user_command(
	  'Close',
	  buffercloser.close,
	  { desc = "-> Smart close buffer" }
	)
end

return configer

