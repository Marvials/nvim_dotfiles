return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            -- ========================================================================
            -- CORE & UTILS
            -- ========================================================================
            quickfile = { enabled = true, exclude = { "latex" } },
            input = { enabled = true },
            styles = {
                input = {
                    keys = {
                        n_esc = { "<C-c>", { "cmp_close", "cancel" }, mode = "n", expr = true },
                        i_esc = { "<C-c>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
                    },
                },
            },

            -- ========================================================================
            -- PICKER (SEARCH & EXPLORER)
            -- Docs: https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
            -- ========================================================================
            picker = {
                enabled = true,
                sources = {
                    explorer = {
                        hidden = true,
                        ignored = true,
                    },
                    files = { hidden = true },
                },
                matchers = {
                    frecency = true,
                    cwd_bonus = false,
                },
                exclude = { ".git", "node_modules", "dist", "build" },
                formatters = {
                    file = {
                        filename_first = true,
                        filename_only = false,
                        icon_width = 2,
                    },
                },
                layout = {
                    preset = "telescope",
                    cycle = false,
                },
                layouts = {
                    select = {
                        preview = false,
                        layout = {
                            backdrop = false,
                            width = 0.6,
                            min_width = 80,
                            height = 0.4,
                            min_height = 10,
                            box = "vertical",
                            border = "rounded",
                            title = "{title}",
                            title_pos = "center",
                            { win = "input",   height = 1,          border = "bottom" },
                            { win = "list",    border = "none" },
                            { win = "preview", title = "{preview}", width = 0.6,      height = 0.4, border = "top" },
                        },
                    },
                    telescope = {
                        reverse = true,
                        layout = {
                            box = "horizontal",
                            backdrop = false,
                            width = 0.8,
                            height = 0.9,
                            border = "none",
                            {
                                box = "vertical",
                                { win = "list",  title = " Results ", title_pos = "center", border = "rounded" },
                                { win = "input", height = 1,          border = "rounded",   title = "{title} {live} {flags}", title_pos = "center" },
                            },
                            {
                                win = "preview",
                                title = "{preview:Preview}",
                                width = 0.50,
                                border = "rounded",
                                title_pos = "center",
                            },
                        },
                    },
                    ivy = {
                        layout = {
                            box = "vertical",
                            backdrop = false,
                            width = 0,
                            height = 0.4,
                            position = "bottom",
                            border = "top",
                            title = " {title} {live} {flags}",
                            title_pos = "left",
                            { win = "input", height = 1, border = "bottom" },
                            {
                                box = "horizontal",
                                { win = "list",    border = "none" },
                                { win = "preview", title = "{preview}", width = 0.5, border = "left" },
                            },
                        },
                    },
                },
            },

            -- ========================================================================
            -- IMAGE SUPPORT (Markdown only)
            -- ========================================================================
            image = {
                enabled = function() return vim.bo.filetype == "markdown" end,
                doc = {
                    float = false,
                    inline = false,
                    max_width = 50,
                    max_height = 30,
                    wo = { wrap = false },
                },
                convert = {
                    notify = true,
                    command = "magick",
                },
                img_dirs = { "img", "images", "assets", "static", "public", "media", "attachments", "Archives/All-Vault-Images/", "~/Library", "~/Downloads" },
            },

            -- ========================================================================
            -- DASHBOARD
            -- ========================================================================
            dashboard = {
			    enabled = true,
                formats = {
                    icon = function(item)
                        if item.file then
                            local icon, hl = require("snacks.util").icon(item.file, item.icon)
                            if item.icon == "directory" then
                                hl = "Directory"
                            end
                            return { icon, width = 2, hl = hl }
                        end
                        return { item.icon or " ", width = 2, hl = "SnacksDashboardIcon" }
                    end,
                    file = function(item)
                        return { vim.fn.fnamemodify(item.file, ":~"), hl = "SnacksDashboardFile" }
                    end,
                    selected = { " ", hl = "SnacksDashboardSelected" },
                },
			    preset = {
				    keys = {
					    { icon = " ", key = "n", desc = "New File", action = ":ene" },
					    {
						    icon = "󰥨 ",
						    key = "f",
					        desc = "Find File",
						    action = function()
							    Snacks.dashboard.pick("files", { cwd = "." })
						    end,
					    },
					    {
						    icon = "󰈞 ",
						    key = "g",
						    desc = "Find Text",
						    action = function()
							    Snacks.dashboard.pick("live_grep")
						    end,
				        },
					    {
						    icon = " ",
						    key = "r",
						    desc = "Recent Files",
						    action = function()
							    Snacks.dashboard.pick("oldfiles")
						    end,
					    },
					    {
						    icon = " ",
						    key = "c",
						    desc = "Config",
						    action = function()
							    require("utils.general").in_yadm_env(function(yadm_repo)
						    		Snacks.dashboard.pick("git_files", { cwd = yadm_repo })
						    	end)
						    end,
					    },
					    {
						    icon = " ",
						    key = "p",
						    desc = "Plugins",
						    action = function()
							    Snacks.picker.lazy()
					        end,
					    },
					    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
					    { icon = " ", key = "q", desc = "Quit", action = ":quit" },
				    },
			    },
    			sections = {
				function()
					return {
						header = require("utils.dashboard").header,
						padding = 1,
						pane = 1,
					}
				end,
				{
					pane = 1,
					section = "terminal",
					cmd = "curl -s 'https://wttr.in/?0FQ' | sed 's/^/               /' || echo -n",
					height = 6,
				},
				{ pane = 1, section = "startup" },
				{ pane = 2, section = "keys", padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "RECENT FILES",
					section = "recent_files",
					indent = 2,
					padding = 1,
				},
				{ pane = 2, icon = "󰙅 ", title = "PROJECTS", section = "projects", indent = 2, padding = 1 },
				{
					pane = 2,
					icon = " ",
					title = "GIT STATUS [" .. vim.fn.trim(vim.fn.system("git branch --show-current")) .. "]",
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() ~= nil
					end,
					cmd = "git --no-pager diff --stat -B -M -C && git status --short --renames",
					height = 5,
					padding = 1,
					ttl = 5 * 60,
					indent = 2,
				},
				{
					pane = 2,
					section = "terminal",
					enabled = function()
						return Snacks.git.get_root() == nil
					end,
					cmd = "cmatrix -br",
					height = 6,
					indent = 2,
					padding = 1,
				},
			},
            },
        },

        -- ========================================================================
        -- KEYMAPS
        -- ========================================================================
        keys = {
            -- Git
            { "<leader>lg",  function() require("snacks").lazygit() end,                                  desc = "Lazygit" },
            { "<leader>gl",  function() require("snacks").lazygit.log() end,                              desc = "Lazygit Logs" },
            { "<leader>gbr", function() require("snacks").picker.git_branches({ layout = "select" }) end, desc = "Pick Git Branch" },

            -- File Management
            { "<leader>e",   function() require("snacks").explorer() end,                                 desc = "Explorer" },
            { "<leader>sm",  function() require("snacks").maximize() end,                                 desc = "Maximize Split" },
            { "<leader>rN",  function() require("snacks").rename.rename_file() end,                       desc = "Rename File" },
            { "<leader>dB",  function() require("snacks").bufdelete() end,                                desc = "Delete Buffer" },

            -- Search / Picker
            { "<leader>pf",  function() require("snacks").picker.files() end,                             desc = "Find Files" },
            { "<leader>pr",  function() require("snacks").picker.recent() end,                            desc = "Recent Files" },
            { "<leader>pc",  function() require("snacks").picker.files({ cwd = "~/.config/nvim" }) end,   desc = "Find Config" },
            { "<leader>ps",  function() require("snacks").picker.grep() end,                              desc = "Grep" },
            { "<leader>pws", function() require("snacks").picker.grep_word() end,                         desc = "Grep Word",      mode = { "n", "x" } },
            { "<leader>pk",  function() require("snacks").picker.keymaps({ layout = "ivy" }) end,         desc = "Search Keymaps" },

            -- Utils
            { "<leader>th",  function() require("snacks").picker.colorschemes({ layout = "ivy" }) end,    desc = "Colorschemes" },
            { "<leader>vh",  function() require("snacks").picker.help() end,                              desc = "Help" },

            -- Terminal
            { "<c-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
            { "<c-_>",      function() Snacks.terminal() end, desc = "which_key_ignore" },
        },
        config = function(_, opts)
            require("snacks").setup(opts)

            -- Abrir dashboard se o Neovim for iniciado com um diretório
            vim.api.nvim_create_autocmd("VimEnter", {
                once = true,
                callback = function()
                    if vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then
                        require("snacks").dashboard.open()
                    end
                end,
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        keys = {
            { "<leader>pt", function() require("snacks").picker.todo_comments() end,                                                desc = "Todo (All)" },

            { "<leader>pT", function() require("snacks").picker.todo_comments({ keywords = { "TODO", "FORGETNOT", "FIXME" } }) end, desc = "Todo (Main)" },
        }
    }
}
