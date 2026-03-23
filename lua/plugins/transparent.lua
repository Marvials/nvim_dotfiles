return {
  "xiyaowong/transparent.nvim",
  lazy = false, -- Carrega ao iniciar para evitar "piscadas" de cor sólida
  config = function()
    require("transparent").setup({
      -- Tabelas de grupos de realce (Highligth Groups) que serão limpos
      extra_groups = {
        "NormalFloat",     -- Fundo de janelas flutuantes (ex: diagnósticos, LspSaga)
        "NvimTreeNormal",  -- Fundo do explorador de arquivos (se aplicar ao Neo-tree)
        "NeoTreeNormal",   -- Fundo específico do Neo-tree
        "NeoTreeNormalNC", -- Fundo do Neo-tree quando não está em foco
      },
      exclude_groups = {
        "SnacksDashboardNormal",
      },
    })
  end,
}
