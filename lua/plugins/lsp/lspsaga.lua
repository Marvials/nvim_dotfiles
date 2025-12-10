return {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach", -- Carrega apenas quando o LSP ativar
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lspsaga").setup({
            ui = {
                border = "rounded",
                code_action = "💡", -- Ícone para code actions
            },
            lightbulb = {
                enable = true, -- Desative se achar que polui a tela (o ícone na lateral)
            },
            symbol_in_winbar = {
                enable = true, -- Breadcrumbs (barra de navegação no topo)
            },
        })

        -- Keymaps do Saga
        local keymap = vim.keymap.set
        
        -- Substitui o <leader>vca nativo
        keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Code Action (Saga)" })
        
        -- Substitui o <leader>rn nativo
        keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { desc = "Smart Rename (Saga)" })
        
        -- Substitui o gd (Go to Definition) nativo ou do Telescope (opcional)
        -- O 'peek' abre uma janelinha flutuante sem sair do lugar.
        keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })
        
        -- Substitui o gR (References) nativo
        keymap("n", "gr", "<cmd>Lspsaga finder<CR>", { desc = "LSP Finder" })
        
        -- Diagnósticos (alternativa ao Trouble/Native)
        keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show Line Diagnostics" })
        
        -- Hover Doc (Documentação)
        -- OBS: O Noice.nvim também mexe nisso. Teste qual você prefere.
        keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "Hover Doc" })
    end,
}
