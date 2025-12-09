return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    config = function()
        require("neo-tree").setup({
              -- Opções Gerais
              close_if_last_window = true, -- Fecha o Neovim se a árvore for a única janela sobrando
              popup_border_style = "rounded", -- Bordas arredondadas para popups
              enable_git_status = true,
              enable_diagnostics = true, -- Mostra erros (LSP) na árvore de arquivos
              
              -- Aparência Visual
              default_component_configs = {
                container = {
                  enable_character_fade = true
                },
                indent = {
                  indent_size = 2,
                  padding = 1, -- Espaço extra
                  with_markers = true,
                  indent_marker = "│",
                  last_indent_marker = "└",
                  highlight = "NeoTreeIndentMarker",
                },
                icon = {
                  folder_closed = "",
                  folder_open = "",
                  folder_empty = "󰜌",
                  -- O padrão usa ícones do devicons
                },
                modified = {
                  symbol = "[+]",
                  highlight = "NeoTreeModified",
                },
                git_status = {
                  symbols = {
                    -- Tipo de mudança
                    added     = "✚", -- ou "A"
                    modified  = "", -- ou "M"
                    deleted   = "✖", -- ou "D"
                    renamed   = "󰁕", -- ou "R"
                    -- Status
                    untracked = "",
                    ignored   = "",
                    unstaged  = "󰄱",
                    staged    = "",
                    conflict  = "",
                  }
                },
              },
              
              -- Configurações de Janela
              window = {
                position = "left",
                width = 30,
                mapping_options = {
                  noremap = true,
                  nowait = true,
                },
                mappings = {
                  ["<space>"] = { 
                      "toggle_node", 
                      nowait = false, -- desabilita wait para evitar conflito com leader
                  },
                  ["<2-LeftMouse>"] = "open",
              ["l"] = "open", -- Abre arquivo ou pasta com 'l' (estilo vim)
              ["h"] = "close_node", -- Fecha pasta com 'h' (estilo vim)
              ["P"] = { "toggle_preview", config = { use_float = true } }, -- Preview flutuante
            }
          },

          -- Configurações do Sistema de Arquivos
          filesystem = {
            filtered_items = {
              visible = false, -- Itens filtrados não aparecem (use H para alternar)
              hide_dotfiles = false,
              hide_gitignored = true,
              hide_by_name = {
                "node_modules",
                ".git"
              },
            },
            follow_current_file = {
              enabled = true, -- Quando você muda de aba, a árvore foca no arquivo correspondente
              leave_dirs_open = false, 
            },
            use_libuv_file_watcher = true, -- Atualiza a árvore automaticamente se arquivos mudarem fora do vim
          },
        })

        -- Tecla de atalho recomendada (adicione isso ou coloque no seu keymaps.lua)
        vim.keymap.set("n", "<leader>nt", ":Neotree toggle<CR>", { desc = "Abrir/Fechar Explorer" })
    end,
  }
}
