return {
	{
		"loctvl842/monokai-pro.nvim",
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
                        ["@type.builtin"] = { fg = "#1965FA"}

					}
				end,
			})
			vim.cmd("colorscheme monokai-pro")
		end,
	},
}
