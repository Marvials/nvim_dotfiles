-- ===============================
-- Comportamento Visual
-- ===============================
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
vim.opt.wrap = false
vim.opt.scrolloff = 8

-- ===============================
-- Espaçamento e Escrita (Tabs)
-- ===============================
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showtabline = 2
vim.opt.backspace = {"start", "eol", "indent"}
vim.opt.isfname:append("@-@")

-- ===============================
-- Buscas (Procurar palavras)
-- ===============================
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- ===============================
-- Janelas e Arquivos
-- ===============================
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true
vim.g.editorconfig = true
vim.opt.clipboard:append('unnamedplus')

-- ===============================
-- Dicas de Código (LSP)
-- ===============================
vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
})
