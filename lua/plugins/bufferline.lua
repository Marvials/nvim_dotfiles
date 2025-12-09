return {
    {
        'akinsho/bufferline.nvim',
        version = "*",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require("bufferline").setup({
                  options = {
                    -- Estilo visual: "slant" (inclinado), "thick" (grosso), "thin" (fino) ou "padded_slant"
                    separator_style = "slant", 
                    
                    -- Mostra erros do LSP direto na aba (muito útil!)
                    diagnostics = "nvim_lsp",
                    
                    -- Configura como o erro aparece (ex: "E: 1")
                    diagnostics_indicator = function(count, level, diagnostics_dict, context)
                      local icon = level:match("error") and " " or " "
                      return " " .. icon .. count
                    end,

                    -- Essa parte é EXCELENTE para quem usa Neo-tree
                    -- Ela empurra as abas para a direita quando o Neo-tree abre
                    offsets = {
                        {
                            filetype = "neo-tree",
                            text = "File Explorer", -- Texto que aparece em cima da árvore
                            text_align = "center",
                            separator = true
                        }
                    },

                    -- Mostra o ícone do arquivo (lua, go, python)
                    show_buffer_icons = true,
                    show_buffer_close_icons = true,
                    show_close_icon = true,
                    
                    -- Ordenar abas (opcional, aqui está por diretório)
                    sort_by = 'extension', 

                    -- Hover: Permite fechar clicando com o mouse
                    hover = {
                        enabled = true,
                        delay = 200,
                        reveal = {'close'}
                    }
                  }
        })
                        
        end,
    }
}
