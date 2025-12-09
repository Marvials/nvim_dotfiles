return {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
        local actions = require("diffview.actions")

        require("diffview").setup({
            enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
            view = {
                -- Configure the layout and behavior of different types of views.
                -- Available layouts: 
                --  'diff1_plain', 'diff2_horizontal', 'diff2_vertical', 'diff3_horizontal', 'diff3_vertical', 'diff4_mixed'
                default = {
                    -- layout = "diff2_horizontal",
                    winbar_info = false, -- See ':h diffview-config-view.x.winbar_info'
                },
                merge_tool = {
                    -- layout = "diff3_horizontal",
                    disable_diagnostics = true, -- Temporarily disable diagnostics for conflict buffers while in the view.
                },
                file_history = {
                    -- layout = "diff2_horizontal",
                },
            },
            keymaps = {
                view = {
                    -- Keymaps for the view mode (e.g. standard diff view)
                    ["<tab>"] = actions.select_next_entry,
                    ["<s-tab>"] = actions.select_prev_entry,
                    ["gf"] = actions.goto_file,
                    ["<C-w><C-f>"] = actions.goto_file_split,
                    ["<C-w>gf"] = actions.goto_file_tab,
                    ["<leader>e"] = actions.focus_files,
                    ["<leader>b"] = actions.toggle_files,
                },
                file_panel = {
                    ["j"] = actions.next_entry,
                    ["k"] = actions.prev_entry,
                    ["<cr>"] = actions.select_entry,
                    ["o"] = actions.select_entry,
                    ["<2-LeftMouse>"] = actions.select_entry,
                    ["-"] = actions.toggle_stage_entry, -- Stage / unstage the selected entry.
                    ["S"] = actions.stage_all, -- Stage all entries.
                    ["U"] = actions.unstage_all, -- Unstage all entries.
                    ["R"] = actions.refresh_files, -- Update stats and entries for the file list.
                    ["<tab>"] = actions.select_next_entry,
                    ["<s-tab>"] = actions.select_prev_entry,
                    ["gf"] = actions.goto_file,
                    ["<C-w><C-f>"] = actions.goto_file_split,
                    ["<C-w>gf"] = actions.goto_file_tab,
                    ["i"] = actions.listing_style, -- Toggle between 'list' and 'tree' views
                    ["f"] = actions.toggle_flatten_dirs, -- Flatten empty subdirectories in tree listing style.
                    ["<leader>e"] = actions.focus_files,
                    ["<leader>b"] = actions.toggle_files,
                },
                file_history_panel = {
                    ["g!"] = actions.options, -- Open the option panel
                    ["<C-A-d>"] = actions.open_in_diffview, -- Open the entry under the cursor in a diffview
                    ["y"] = actions.copy_hash, -- Copy the commit hash of the entry under the cursor
                    ["L"] = actions.open_commit_log,
                    ["zR"] = actions.open_all_folds,
                    ["zM"] = actions.close_all_folds,
                    ["j"] = actions.next_entry,
                    ["k"] = actions.prev_entry,
                    ["<cr>"] = actions.select_entry,
                    ["o"] = actions.select_entry,
                    ["<2-LeftMouse>"] = actions.select_entry,
                    ["<tab>"] = actions.select_next_entry,
                    ["<s-tab>"] = actions.select_prev_entry,
                    ["gf"] = actions.goto_file,
                    ["<C-w><C-f>"] = actions.goto_file_split,
                    ["<C-w>gf"] = actions.goto_file_tab,
                    ["<leader>e"] = actions.focus_files,
                    ["<leader>b"] = actions.toggle_files,
                },
            },
        })
        
        -- Keymaps para abrir o diffview facilmente
        vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", { desc = "Open Diffview" })
        vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", { desc = "Open File History" })
        vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Close Diffview" })
    end,
}
