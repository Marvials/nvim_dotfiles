return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("aerial").setup({
      -- Prioridade dos backends (Treesitter é geralmente o melhor para Go)
      backends = { "treesitter", "lsp", "markdown", "man" },

      -- Fecha o aerial automaticamente se ele for a única janela sobrando
      close_on_last_window = true,

      -- Configuração visual
      layout = {
        max_width = { 40, 0.2 }, -- Largura máxima (40 colunas ou 20% da tela)
        width = nil,
        min_width = 20,
        
        -- Onde a janela abre
        default_direction = "prefer_right", 
        placement = "window",
      },

      -- Ícones (usa os mesmos do devicons/lspkind que você já tem)
      show_guides = true, -- Linhas guia de indentação na árvore

      -- Filtra o que mostrar (reduz ruído)
      filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
        "Variable", -- Útil em Go para variáveis globais exportadas
      },

      -- Quando anexar ao buffer, definir atalhos locais
      on_attach = function(bufnr)
        -- Atalhos para navegar DENTRO da janela do aerial (estilo vim)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    })

    -- Atalho global para abrir/fechar (Leader + o de "Outline")
    -- Escolhi <leader>o pois <leader>a já é usado pelo seu Harpoon
    vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle!<CR>", { desc = "Toggle Outline (Aerial)" })
  end,
}
