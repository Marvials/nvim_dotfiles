return {
	{
		"loctvl842/monokai-pro.nvim",
        lazy = false,
        priority  = 1000,
		config = function()
			require("monokai-pro").setup({
                
				-- Função para sobrescrever cores padrões
				override = function(c)
					return {
						-- Define a cor para variáveis gerais
						["@variable"] = { fg = "#9D7CD8" },
						-- Define a cor para membros de objetos/structs (ex: user.name)
                        ["@variable.member"] = { fg = "#FB8B1C"},
                        -- Strings
                        ["@string"] = { fg = "#53EB4B"},

                        ["@function"] = { fg = "#FFD866" },
                        ["@function.call"] = { fg = "#FFD866" },
                        ["@function.builtin"] = { fg = "#FFD866" }, -- ex: len(), print()
                        ["@function.macro"] = { fg = "#FFD866" },
                        ["@function.method.call"] = { fg = "#FFD866" },
                        ["@function.method"] = { fg = "#FFD866" },

                        ["@type.definition"] = { fg = "#1964FA"},
                        ["@type"] = { fg = "#1965FA"},
                        ["@type.builtin"] = { fg = "#1965FA"},

                        -- Dashboard Highlights (Snacks.nvim)
                        ["SnacksDashboardNormal"] = { bg = "#2D2A2E" },
                        ["SnacksDashboardIcon"] = { fg = "#78DCE8", bg = "none" },
                        ["Directory"] = { fg = "#78DCE8", bg = "none" },
                        ["SnacksDashboardFile"] = { fg = "#FC9867" },
                        ["SnacksDashboardDir"] = { fg = "#78DCE8" },
                        ["SnacksDashboardHeader"] = { fg = "#AB9DF2" },
                        ["SnacksDashboardFooter"] = { fg = "#FF6188" },
                        ["SnacksDashboardKey"] = { fg = "#FC9867" },
                        ["SnacksDashboardDesc"] = { fg = "#FF6188" },
					}
				end,
			})
			vim.cmd("colorscheme monokai-pro")
		end,
	},
}
