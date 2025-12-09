return {
    "MagicDuck/grug-far.nvim",
    opts = {
        headerMaxWidth = 80,
    },
    cmd = "GrugFar",
    keys = {
        {
            "<leader>srp",
            function()
                local grug = require("grug-far")
                local ext = vim.bo.filetype
                -- Abre com a extensão do arquivo atual pré-preenchida no filtro de arquivos
                grug.open({ prefills = { filesFilter = "*." .. ext } })
            end,
            mode = { "n", "v" },
            desc = "Search and Replace (Grug-far)",
        },
        {
            "<leader>srpw",
            function()
               local grug = require("grug-far")
                local ext = vim.bo.filetype
                -- Pega a palavra sob o cursor e já preenche a busca
                grug.open({
                    prefills = {
                        search = vim.fn.expand("<cword>"),
                        filesFilter = "*." .. ext,
                    },
                })
            end,
            mode = { "n" },
            desc = "Search and Replace Current Word (Grug-far)",
        },
    },
}
