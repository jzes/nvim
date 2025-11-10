return {
    {
        "jzes/ninote.nvim", -- caminho pro diretório onde está o plugin
        config = function()
            require("ninote").setup({
                NoteDir = "~/meus-arquivos/notes",
                SearchEngine = "fzf-lua",
                NewNoteHeader = "New Awesome Note\n\n",
                OpenSearch = "float",
            })
        end
    }
}
