vim.opt.relativenumber = true
vim.opt.clipboard:append('unnamedplus')
vim.opt.hlsearch = true
vim.opt.cursorline = true
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.showtabline = 4
vim.opt.wrap = false

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8

vim.opt.backspace = {"start", "eol", "indent"}

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.incsearch = true
vim.opt.inccommand = "split"
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.isfname:append("@-@")
vim.opt.updatetime = 100
vim.opt.colorcolumn = "100"

vim.opt.mouse = "a"
vim.opt.mousemoveevent = true
vim.g.editorconfig = true


vim.lsp.inlay_hint.enable(true)

vim.diagnostic.config({
  virtual_text = true, -- Exibe os erros diretamente no código (como na sua imagem)
  signs = true,        -- Mostra os símbolos na lateral
  update_in_insert = false,
  severity_sort = true,
})
