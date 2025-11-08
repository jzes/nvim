local options = {}

local function setupInterface()
    vim.opt.number = true                                                   -- mostra número da linha
    vim.opt.relativenumber = true                                           -- números relativos
    vim.opt.cursorline = true                                               -- destaca a linha do cursor
    vim.opt.termguicolors = true                                            -- ativa cores verdadeirasend
    vim.api.nvim_set_hl(0, "CursorInsert", { fg = "#000000", bg = "#00ff00" }) -- Insert (verde)
    vim.api.nvim_set_hl(0, "CursorReplace", { fg = "#000000", bg = "#ff0000" }) -- Replace (vermelho)
end

local function setupIdentation()
    vim.opt.tabstop = 4        -- tamanho de tabulação (tab real)
    vim.opt.shiftwidth = 4     -- tamanho de indentação (>> <<)
    vim.opt.expandtab = true   -- converte tabs em espaços
    vim.opt.smartindent = true -- indentação automática inteligente
end

local function setupSearch()
    vim.opt.ignorecase = true -- ignora maiúsculas em buscas
    vim.opt.smartcase = true  -- diferencia maiúsculas se houver na busca
    vim.opt.incsearch = true  -- busca incremental
    vim.opt.hlsearch = true   -- destaca resultados da busca
end

local function setupBehavior()
    vim.opt.scrolloff = 8             -- mantém 8 linhas de margem ao rolar
    vim.opt.sidescrolloff = 8         -- margem horizontal
    vim.opt.wrap = false              -- não quebra linha automaticamente
    vim.opt.signcolumn = "yes"        -- sempre mostra a coluna de sinais
    vim.opt.mouse = "a"               -- ativa mouse em todos os modos
    vim.opt.clipboard = "unnamedplus" -- usa clipboard do sistema
    vim.opt.wrap = false              -- não quebra linha automaticamente
    vim.opt.signcolumn = "yes"        -- sempre mostra a coluna de sinais
end

local function setupDiagnostic()
    vim.diagnostic.config({
        virtual_text = true, -- ou true se quiser o texto inline também
        float = {
            border = "rounded",
            source = true,
            header = "",
            prefix = "",
        },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
    })
end

function options.setup()
    setupInterface()
    setupIdentation()
    setupSearch()
    setupBehavior()
    setupDiagnostic()
end

return options
