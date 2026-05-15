return {
    "HiPhish/rainbow-delimiters.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local rainbow_delimiters = require("rainbow-delimiters")

        -- Lista de filetypes onde o plugin deve ser desativado
        local blacklist = {
            "noice",
            "snacks_picker",
            "snacks_picker_input",
            "snacks_input",
            "neo-tree",
            "lazy",
            "mason",
            "notify",
            "noice_popup",
            "noice_cmdline",
        }

        require("rainbow-delimiters.setup").setup({
            strategy = {
                [""] = function(bufnr)
                    local ft = vim.bo[bufnr].filetype
                    local buftype = vim.bo[bufnr].buftype

                    -- Desativa para buffers de UI e buffers especiais
                    if buftype == "nofile" or buftype == "prompt" then
                        return nil
                    end

                    for _, blacklisted in ipairs(blacklist) do
                        if ft == blacklisted then
                            return nil
                        end
                    end

                    return rainbow_delimiters.strategy["global"]
                end,
                vim = rainbow_delimiters.strategy["local"],
            },
            query = {
                [""] = "rainbow-delimiters",
                lua = "rainbow-blocks",
            },
            highlight = {
                "RainbowDelimiterRed",
                "RainbowDelimiterYellow",
                "RainbowDelimiterBlue",
                "RainbowDelimiterOrange",
                "RainbowDelimiterGreen",
                "RainbowDelimiterViolet",
                "RainbowDelimiterCyan",
            },
        })
    end,
}
