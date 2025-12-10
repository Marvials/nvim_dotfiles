local opts = {noremap = true, silent = true}

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection"})
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection"})

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centerd"})
keymap("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centerd"})

keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Clipboard things
-- Paste without replacing clipboard content
keymap("x", "<leader>p", [["_dP]])

keymap("v", "p", '"_dp', opts)

keymap("n", "x", '"_x', opts) --prevents deleted characters from copying to clipboard
-- End clipboard things

keymap("i", "<C-c>", "<Esc>")

keymap("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true})

keymap("n", "<leader>fo", vim.lsp.buf.format)
keymap("n", "Q", "<nop>")


keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })
-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

-- tab stuff
keymap("n", "<leader>to", "<cmd>tabnew<CR>")   --open new tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>") --close current tab
keymap("n", "<leader>tn", "<cmd>tabn<CR>")     --go to next
keymap("n", "<leader>tp", "<cmd>tabp<CR>")     --go to pre
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>") --open current tab in new tab

--split management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window vertically
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Copy filepath to the clipboard
keymap("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- Toggle LSP diagnostics visibility
local isLspDiagnosticsVisible = true
keymap("n", "<leader>lx", function()
    isLspDiagnosticsVisible = not isLspDiagnosticsVisible
    vim.diagnostic.config({
        virtual_text = isLspDiagnosticsVisible,
        underline = isLspDiagnosticsVisible
    })
end, { desc = "Toggle LSP diagnostics" })

-- BUFFERLINE
-- Navegar entre os buffers (abas)
vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Aba Anterior" })
vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Próxima Aba" })

-- Mover a aba de lugar (reordenar)
vim.keymap.set("n", "<leader>bl", ":BufferLineMoveNext<CR>", { desc = "Mover aba p/ direita" })
vim.keymap.set("n", "<leader>bh", ":BufferLineMovePrev<CR>", { desc = "Mover aba p/ esquerda" })

-- Fechar aba atual (sem fechar o neovim)
vim.keymap.set("n", "<leader>bc", ":bdelete<CR>", { desc = "Fechar Buffer" })

-- Pinar aba (para ela não fechar sem querer)
vim.keymap.set("n", "<leader>bp", ":BufferLineTogglePin<CR>", { desc = "Pinar/Despinar Aba" })

-- END BUFFERLINE







