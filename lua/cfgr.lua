local cfgr = {}

function cfgr.basic_cfg()
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
	  	set clipboard=unnamedplus
	  	set confirm
	]])
end

return cfgr

