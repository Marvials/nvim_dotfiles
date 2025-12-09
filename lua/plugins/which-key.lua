return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500 -- Tempo (em ms) para o popup aparecer após apertar a tecla
	end,
	opts = {
		-- Aqui você personaliza a aparência e comportamento
		preset = "modern", -- Opções: "classic", "modern", "helix"

		-- Configuração de grupos (labels para seus atalhos existentes)
		spec = {
			{ "<leader>?b", group = "Buffers" },
			{ "<leader>?c", group = "Code/Clear" },
			{ "<leader>?d", group = "Debug/Delete" },
			{ "<leader>?f", group = "File/Format" },
			{ "<leader>?g", group = "Git" },
			{ "<leader>?l", group = "LSP/Lint" },
			{ "<leader>?p", group = "Picker/Paste" },
			{ "<leader>?s", group = "Split/Search" },
			{ "<leader>?t", group = "Tabs/Toggle" },
			{ "<leader>?w", group = "Worktree/Session" },
			{ "<leader>?x", group = "Trouble/Exec" },
		},
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Ver atalhos locais (Buffer)",
		},
	},
}
