local installer = {}

function installer.install()
	vim.cmd([[
		call plug#begin()
		Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
		Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
		Plug 'junegunn/fzf.vim'
		Plug 'stsewd/fzf-checkout.vim'
		Plug 'charlespascoe/vim-go-syntax'
		Plug 'jiangmiao/auto-pairs'
		Plug 'nvim-tree/nvim-web-devicons'
		Plug 'Bekaboo/dropbar.nvim'
		Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' }
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
		Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
		Plug 'lewis6991/gitsigns.nvim' 	
		Plug 'nvim-tree/nvim-tree.lua'
		Plug 'antosha417/nvim-lsp-file-operations'
		Plug 'lukas-reineke/headlines.nvim'
		Plug 'Kicamon/markdown-table-mode.nvim'
		Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
		Plug 'tpope/vim-surround'
		Plug 'neanias/everforest-nvim', { 'branch': 'main' }
		Plug 'numToStr/Comment.nvim'
		Plug 'akinsho/toggleterm.nvim'
		Plug 'nvim-lualine/lualine.nvim'
		Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
		Plug 'mg979/vim-visual-multi', {'branch': 'master'}
		Plug 'goolord/alpha-nvim'
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
		Plug 'nvim-telescope/telescope-live-grep-args.nvim'
		Plug 'folke/noice.nvim'
		Plug 'MunifTanjim/nui.nvim'
		Plug 'neovim/nvim-lspconfig'
		Plug 'williamboman/mason.nvim'
		Plug 'williamboman/mason-lspconfig.nvim'

		" Autocomplete
		Plug 'hrsh7th/nvim-cmp'
		" Fonte para LSP
		Plug 'hrsh7th/cmp-nvim-lsp'
		" Fonte para buffer
		Plug 'hrsh7th/cmp-buffer'
		" Fonte para arquivos
		Plug 'hrsh7th/cmp-path'
		" Snippets (opcional)
		Plug 'L3MON4D3/LuaSnip'
		" Integração de snippets com cmp
		Plug 'saadparwaiz1/cmp_luasnip'
		Plug 'rcarriga/nvim-notify'
		Plug 'OXY2DEV/markview.nvim'
		
		Plug 'echasnovski/mini.map'
		Plug 'olimorris/onedarkpro.nvim'
		Plug 'ellisonleao/gruvbox.nvim'
		call plug#end()
	]])
end

return installer
