
local options = {}

local function setupInterface()
    vim.opt.number = true                -- mostra número da linha
    vim.opt.relativenumber = true        -- números relativos
    vim.opt.cursorline = true            -- destaca a linha do cursor
    vim.opt.termguicolors = true         -- ativa cores verdadeirasend
end

local function setupIdentation()
    vim.opt.tabstop = 4                  -- tamanho de tabulação (tab real)
    vim.opt.shiftwidth = 4               -- tamanho de indentação (>> <<)
    vim.opt.expandtab = true             -- converte tabs em espaços
    vim.opt.smartindent = true           -- indentação automática inteligente 
end

local function setupSearch()
    vim.opt.ignorecase = true            -- ignora maiúsculas em buscas
    vim.opt.smartcase = true             -- diferencia maiúsculas se houver na busca
    vim.opt.incsearch = true             -- busca incremental
    vim.opt.hlsearch = true              -- destaca resultados da busca
end

local function setupBehavior()
    vim.opt.scrolloff = 8                -- mantém 8 linhas de margem ao rolar
    vim.opt.sidescrolloff = 8            -- margem horizontal
    vim.opt.wrap = false                 -- não quebra linha automaticamente
    vim.opt.signcolumn = "yes"           -- sempre mostra a coluna de sinais
    vim.opt.mouse = "a"                  -- ativa mouse em todos os modos
    vim.opt.clipboard = "unnamedplus"   -- usa clipboard do sistema
    vim.opt.wrap = false                 -- não quebra linha automaticamente
    vim.opt.signcolumn = "yes"           -- sempre mostra a coluna de sinais
end

function options.setup()
   setupInterface()
   setupIdentation()
   setupSearch()
   setupBehavior()
end

return options
