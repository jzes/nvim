local fzf = {}

function fzf.configure()
	--configura o layout do fzf
	vim.opt.termguicolors = true
	vim.env.FZF_DEFAULT_OPTS = '--layout=reverse --info=inline --color=fg:#c6d0f5,bg:#303446,hl:#f2d5cf,fg+:#c6d0f5,bg+:#45475a,hl+:#f2d5cf,info:#81c8be,prompt:#f4b8e4,pointer:#f2d5cf,marker:#f2d5cf,spinner:#ca9ee6,header:#c6d0f5'
	vim.env.FZF_PREVIEW_OPTS = '--color=fg:#c6d0f5,bg:#303446,hl:#f2d5cf,fg+:#c6d0f5,bg+:#45475a,hl+:#f2d5cf,info:#81c8be,prompt:#f4b8e4,pointer:#f2d5cf,marker:#f2d5cf,spinner:#ca9ee6,header:#c6d0f5'
	
	vim.g.fzf_layout = {
		up = '~90%',
		window = {
			width = 0.8,
			height = 0.8,
			yoffset = 0.5,
			xoffset = 0.5
		}
	}
end

return fzf
