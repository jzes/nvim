return {
    { "jzes/ninote.nvim",
config = function()
        require("ninote").setup({
            NoteDir = "~/Documents/nvim-notes/",
            SearchEngine = "fzf-lua", -- You can use 'fzf' or 'telescope'
            NewNoteHeader = "## Nota", -- Default header for new notes
            OpenSearch = "float"
        })
    end,
    }
}
