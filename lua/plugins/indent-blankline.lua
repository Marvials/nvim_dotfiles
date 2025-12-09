return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl", -- Define o ponto de entrada principal para a versão 3
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        -- Caractere usado para a linha de indentação
        indent = {
            char = "│", 
            tab_char = "│",
        },
        -- Escopo: destaca o bloco de código atual (função, if, etc)
        scope = {
            enabled = true,
            show_start = false, -- Desativa a linha sublinhada no início do escopo
            show_end = false,   -- Desativa a linha sublinhada no fim do escopo
        },
        -- Arquivos e situações onde o plugin NÃO deve aparecer
        exclude = {
            filetypes = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
                "snacks_dashboard", -- Importante para o seu dashboard do Snacks
            },
        },
    },
}
