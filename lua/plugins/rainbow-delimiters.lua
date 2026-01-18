return {
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local rainbow_delimiters = require("rainbow-delimiters")

        vim.g.rainbow_delimiters = {
            strategy = {
                -- Estratégia global para a maioria dos arquivos
                [''] = rainbow_delimiters.strategy['global'],
                -- Use estratégia local para arquivos muito grandes ou complexos (opcional)
                vim = rainbow_delimiters.strategy['local'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
                -- Em Go, html, etc., o padrão funciona muito bem
            },
            -- Se quiser personalizar as cores para combinar com seu tema Monokai Pro
            -- O padrão já busca cores do seu esquema, mas aqui você pode forçar:
            highlight = {
                'RainbowDelimiterRed',
                'RainbowDelimiterYellow',
                'RainbowDelimiterBlue',
                'RainbowDelimiterOrange',
                'RainbowDelimiterGreen',
                'RainbowDelimiterViolet',
                'RainbowDelimiterCyan',
            },
        }
    end,
}
