return {
  "olexsmir/gopher.nvim",
  ft = "go",
  -- O gopher.nvim ajuda com tarefas comuns de Go, como gerar tags de struct e interfaces
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("gopher").setup({
      commands = {
        go = "go",
        gomodifytags = "gomodifytags",
        gotests = "gotests",
        impl = "impl",
        iferr = "iferr",
      },
    })

    -- Atalhos específicos para Go (somente em arquivos .go)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "go",
      callback = function()
        local opts = { buffer = true, silent = true }

        -- Gerar if err != nil automático
        opts.desc = "Go: Generate if err"
        vim.keymap.set("n", "<leader>ge", "<cmd>GoIfErr<CR>", opts)

        -- Adicionar tags JSON em structs
        opts.desc = "Go: Add JSON tags"
        vim.keymap.set("n", "<leader>gj", "<cmd>GoTagAdd json<CR>", opts)

        -- Adicionar tags YAML em structs
        opts.desc = "Go: Add YAML tags"
        vim.keymap.set("n", "<leader>gy", "<cmd>GoTagAdd yaml<CR>", opts)

        -- Gerar testes para a função sob o cursor
        opts.desc = "Go: Generate test"
        vim.keymap.set("n", "<leader>gt", "<cmd>GoTestAdd<CR>", opts)

        -- Gerar todos os testes para o arquivo atual
        opts.desc = "Go: Generate all tests"
        vim.keymap.set("n", "<leader>gT", "<cmd>GoTestsAll<CR>", opts)

        -- Gerar implementação de interface (ex: :GoImpl io.Reader)
        opts.desc = "Go: Implement interface"
        vim.keymap.set("n", "<leader>gi", ":GoImpl ", { buffer = true }) -- Deixa o comando aberto para digitar a interface
      end,
    })
  end,
  build = function()
    vim.cmd([[silent! GoInstallDeps]])
  end,
}
