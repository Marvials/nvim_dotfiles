local opts = {noremap = true, silent = true}
local keymap = vim.keymap.set -- Nosso apelido curtinho para criar botões

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ===============================
-- Movimentação e Edição
-- ===============================
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down in visual selection" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up in visual selection" })
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz", { desc = "Move down in buffer with cursor centered" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Move up in buffer with cursor centered" })
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Arrumar o recuo do texto
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- ===============================
-- Área de Transferência (Copiar/Colar)
-- ===============================
-- Cola por cima do texto selecionado sem perder o que estava copiado
keymap("x", "<leader>p", [["_dP]], { desc = "Paste without replacing clipboard" })
-- Deleta letras sem copiar para a memória do robô
keymap("n", "x", '"_x', opts)

-- ===============================
-- Utilidades Gerais
-- ===============================
keymap("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })
keymap("n", "<C-c>", ":nohl<CR>", { desc = "Clear search highlight", silent = true })
keymap("n", "<leader>fo", vim.lsp.buf.format, { desc = "Format current file" })
keymap("n", "Q", "<nop>")
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })
keymap("n", "<leader>rs", ":source $MYVIMRC<CR>", { desc = "Reset/Reload Neovim config" })
keymap("n", "<leader>shk", ":ShowkeysToggle<CR>", {desc = "ShowkeysToggle"})

-- Copiar o caminho do arquivo
keymap("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~")
  vim.fn.setreg("+", filePath)
  print("File path copied: " .. filePath)
end, { desc = "Copy file path to clipboard" })

-- ===============================
-- Janelas (Splits) e Abas do Neovim
-- ===============================
keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- ===============================
-- Bufferline (Navegação Visual)
-- ===============================
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer tab" })
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next buffer tab" })
keymap("n", "<leader>bl", ":BufferLineMoveNext<CR>", { desc = "Move tab right" })
keymap("n", "<leader>bh", ":BufferLineMovePrev<CR>", { desc = "Move tab left" })
keymap("n", "<leader>bc", function()
    local bufnr = vim.api.nvim_get_current_buf()
    vim.cmd("bprevious")
    vim.cmd("confirm bdelete " .. bufnr)
end, { desc = "Close current buffer safely" })
keymap("n", "<leader>bp", ":BufferLineTogglePin<CR>", { desc = "Pin/Unpin buffer tab" })

-- ===============================
-- Diagnósticos e Coisas Automáticas
-- ===============================
local isLspDiagnosticsVisible = true
keymap("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = "Toggle LSP diagnostics" })

-- Brilhar quando copiar algo
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})







