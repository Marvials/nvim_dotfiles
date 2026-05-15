return {
	{
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				-- Função para sobrescrever cores padrões
				override = function(c)
					return {
						-- Define a cor para variáveis gerais
						["@variable"] = { fg = "#9D7CD8" },
						-- Define a cor para membros de objetos/structs (ex: user.name)
						["@variable.member"] = { fg = c.base.blue },
						-- Strings
						["@string"] = { fg = "#53EB4B" },

						-- Funções e Métodos (Dourado Forte)
						["@function"] = { fg = "#FFD700" },
						["@function.call"] = { fg = "#FFD700" },
						["@function.builtin"] = { fg = "#FFD700" },
						["@function.macro"] = { fg = "#FFD700" },
						["@function.method.call"] = { fg = "#FFD700" },
						["@function.method"] = { fg = "#FFD700" },
						["@method"] = { fg = "#FFD700" },
						["@method.call"] = { fg = "#FFD700" },

						["@type.definition"] = { fg = c.base.cyan },
						["@type"] = { fg = c.base.cyan },
						["@type.builtin"] = { fg = c.base.cyan },

						-- Java e LSP Semantic Tokens (Propriedades/Campos em Laranja)
						["@lsp.type.property.java"] = { fg = c.base.blue },
						["@lsp.type.variable.java"] = { fg = c.base.blue }, -- JDTLS costuma usar variable para fields
						["@lsp.type.member.java"] = { fg = c.base.blue },
						["@lsp.type.field.java"] = { fg = c.base.blue },

						-- Modificadores Java (static, final, readonly, etc)
						["@lsp.typemod.variable.static.java"] = { fg = c.base.blue, bold = true },
						["@lsp.typemod.variable.readonly.java"] = { fg = c.base.blue, italic = true },
						["@lsp.typemod.property.static.java"] = { fg = c.base.blue, bold = true },
						["@lsp.typemod.property.readonly.java"] = { fg = c.base.blue, italic = true },
						["@lsp.typemod.member.static.java"] = { fg = c.base.blue, bold = true },
						["@lsp.typemod.variable.declaration.java"] = { fg = c.base.blue },

						["@property"] = { fg = c.base.blue },
						["@variable.member"] = { fg = c.base.blue },
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
