return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- Necessário para os ícones
		"MunifTanjim/nui.nvim",
	},
	keys = {
		-- Atalho para abrir/fechar o explorer (Espaço + e)
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree" },
	},
	config = function()
		-- Se quiser mudar a cor de fundo para ficar transparente ou diferente, mude aqui:
		-- vim.cmd([[ highlight NeoTreeNormal guibg=#NONE ]])
		vim.api.nvim_set_hl(0, "NeoTreeGold", { fg = "#FFD700" }) -- Amarelo para Service
		vim.api.nvim_set_hl(0, "NeoTreeGreen", { fg = "#428850" }) -- Verde para Cmd
		vim.api.nvim_set_hl(0, "NeoTreeGray", { fg = "#808080" }) -- Cinza para Internal
		vim.api.nvim_set_hl(0, "NeoTreeBlue", { fg = "#00ADD8" }) -- Azul Go
		vim.api.nvim_set_hl(0, "NeoTreeRed", { fg = "#e46e6e" }) -- Repository (Tom avermelhado)
		vim.api.nvim_set_hl(0, "NeoTreePurple", { fg = "#be93fd" }) -- Controller (Tom roxo/lavanda)
		vim.api.nvim_set_hl(0, "NeoTreeOrange", { fg = "#ff9e64" })
		vim.api.nvim_set_hl(0, "NeoTreeBrown", { fg = "#d19a66" })

		local folder_custom_icons = {
			-- Service (Regra de Negócio)
			["service"] = { icon = "", hl = "NeoTreeGold" },
			["services"] = { icon = "", hl = "NeoTreeGold" },

			-- Cmd (Entrada/Main)
			["cmd"] = { icon = "", hl = "NeoTreeGreen" },

			-- Internal (Privado)
			["internal"] = { icon = "", hl = "NeoTreeGray" },

			-- Pkg (Bibliotecas públicas)
			["pkg"] = { icon = "", hl = "NeoTreeBlue" },

			-- Repository (Banco de Dados / Persistência)
			["repository"] = { icon = "", hl = "NeoTreeBrown" },
			["repositories"] = { icon = "", hl = "NeoTreeBrown" },
			["infra"] = { icon = "", hl = "NeoTreeBrown" },

			-- Model / Entities (Laranja - Cubo)
			["model"] = { icon = "", hl = "NeoTreeOrange" },
			["models"] = { icon = "", hl = "NeoTreeOrange" },
			["entities"] = { icon = "", hl = "NeoTreeOrange" }, -- Muito comum
			["dto"] = { icon = "", hl = "NeoTreeOrange" },

			-- Database / Migrations (Vermelho - Cilindro)
			["database"] = { icon = "", hl = "NeoTreeRed" },
			["db"] = { icon = "", hl = "NeoTreeRed" },
			["migrations"] = { icon = "", hl = "NeoTreeRed" },
			["sql"] = { icon = "", hl = "NeoTreeRed" },

			-- Controller (API / Rotas)
			["controller"] = { icon = "", hl = "NeoTreePurple" },
			["controllers"] = { icon = "", hl = "NeoTreePurple" },
			["handlers"] = { icon = "", hl = "NeoTreePurple" }, -- Go usa muito "handlers"
		}

		require("neo-tree").setup({
			close_if_last_window = true, -- Fecha o Neovim se a árvore for a única janela sobrando
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_diagnostics = true,

			-- Configurações visuais (Ícones e Cores)
			default_component_configs = {
				indent = {
					indent_size = 2,
					padding = 1, -- Extra padding on left hand side
					with_markers = true,
					indent_marker = "│",
					last_indent_marker = "└",
					highlight = "NeoTreeIndentMarker",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					-- O provedor padrão usa o nvim-web-devicons (nossa config anterior)
					provider = function(icon, node, state)
						-- Lógica para PASTAS
						if node.type == "directory" then
							local custom = folder_custom_icons[node.name]
							if custom then
								icon.text = custom.icon
								icon.highlight = custom.hl
								return -- Se achou personalizado, encerra aqui e usa ele
							end
						end

						-- Lógica para ARQUIVOS (continua usando o web-devicons)
						if node.type == "file" or node.type == "terminal" then
							local success, web_devicons = pcall(require, "nvim-web-devicons")
							local name = node.name
							local ext = node.ext
							if success then
								local devicon, hl = web_devicons.get_icon(name, ext)
								icon.text = devicon or icon.text
								icon.highlight = hl or icon.highlight
							end
						end
					end,
				},
				modified = {
					symbol = "[+]",
					highlight = "NeoTreeModified",
				},
				name = {
					trailing_slash = false,
					use_git_status_colors = true,
					highlight = "NeoTreeFileName",
				},
				git_status = {
					symbols = {
						-- Tipo de alteração
						added = "", -- ou "✚", mas costuma poluir
						modified = "", -- ou "",
						deleted = "✖",
						renamed = "󰁕",
						-- Status
						untracked = "",
						ignored = "",
						unstaged = "󰄱",
						staged = "",
						conflict = "",
					},
				},
			},

			-- Configuração da Janela Lateral
			window = {
				position = "left",
				width = 30,
				mapping_options = {
					noremap = true,
					nowait = true,
				},
				mappings = {
					["<space>"] = {
						"toggle_node",
						nowait = false, -- desabilita wait para o space funcionar rápido
					},
					["<2-LeftMouse>"] = "open",
					["<cr>"] = "open",
					["<esc>"] = "cancel", -- fecha ações de renomear/criar
					["P"] = { "toggle_preview", config = { use_float = true } }, -- Pré-visualizar arquivo
					["l"] = "open", -- navegar estilo vim (h,j,k,l)
					["h"] = "close_node",
					["C"] = "close_node",
					["z"] = "close_all_nodes",
					["a"] = {
						"add",
						-- Habilita criar arquivos com trailing slash para pastas (ex: foo/)
						config = { show_path = "none" },
					},
					["A"] = "add_directory",
					["d"] = "delete",
					["r"] = "rename",
					["y"] = "copy_to_clipboard",
					["x"] = "cut_to_clipboard",
					["p"] = "paste_from_clipboard",
					["c"] = "copy",
				},
			},

			-- Configuração do Sistema de Arquivos
			filesystem = {
				filtered_items = {
					visible = false, -- esconder arquivos filtrados
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_hidden = true, -- esconde arquivos ocultos do sistema
					hide_by_name = {
						--"node_modules"
					},
					hide_by_pattern = {
						--"*.meta",
						--"*/src/*/tsconfig.json",
					},
					always_show = { -- sempre mostra, mesmo se for oculto
						".gitignored",
					},
					never_show = { -- nunca mostra
						--".DS_Store",
						--"thumbs.db"
					},
				},
				-- Esta opção faz o Explorer "seguir" o arquivo que você abriu (estilo VS Code)
				follow_current_file = {
					enabled = true,
					leave_dirs_open = false,
				},
				-- Usa a biblioteca "trash" do sistema ao deletar (mais seguro que rm -rf)
				use_libuv_file_watcher = true, -- atualiza a árvore automaticamente se mudar externamente
			},
		})
	end,
}
