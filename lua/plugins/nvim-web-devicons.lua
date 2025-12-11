return {
  "nvim-tree/nvim-web-devicons",
  lazy = true, -- Carrega apenas quando necessário (pelo Neo-tree ou Telescope)
  config = function()
    require("nvim-web-devicons").setup({
      -- Habilita ícones coloridos (true é o padrão)
      color_icons = true,
      
      -- Define o ícone padrão se nenhum for encontrado
      default = true,
      
      -- 1. SOBRESCRITAS GLOBAIS POR EXTENSÃO (Afeta todos os arquivos .extensão)
      override = {
        -- Personalização do Golang
        go = {
          icon = "",      -- Gopher do Go (precisa da Nerd Font atualizada)
          color = "#00ADD8", -- Azul Ciano Oficial do Go
          cterm_color = "74",
          name = "Go",
        },
        -- Exemplo extra: mudando arquivo de configuração .env para algo mais visível
        ["env"] = {
          icon = "",
          color = "#faf743",
          name = "Env"
        }
      },

      override_by_filename = {
        ["go.mod"] = {
          icon = "",
          color = "#00ADD8",
          name = "GoMod"
        },
        ["go.sum"] = {
          icon = "",
          color = "#9c27b0", -- Roxo para diferenciar do .go normal
          name = "GoSum"
        },
      }
    })
  end
}
