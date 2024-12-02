local telescoper = {}

function telescoper.config()
	require("telescope").load_extension('live_grep_args')
	require("telescope").load_extension("coc")
end

return telescoper
