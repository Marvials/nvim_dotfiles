return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        require("nvim-treesitter.configs").setup {
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["<leader>tf"] = "@function.outer",
                        ["<leader>ti"] = "@function.inner",
                        ["<leader>tc"] = "@class.outer",
                        ["<leader>tx"] = "@class.inner",
                        ["<leader>to"] = "@conditional.outer",
                        ["<leader>tci"] = "@conditional.inner",
                        ["<leader>tl"] = "@loop.outer",
                        ["<leader>tli"] = "@loop.inner",
                        ["<leader>tp"] = "@parameter.outer",
                        ["<leader>tpi"] = "@parameter.inner",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["<leader>ts"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["<leader>tS"] = "@parameter.inner",
                    },
                },
            },
        }

        -- keymaps
        vim.keymap.set({ "v", "o" }, "<leader>tf", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects")
        end)
        vim.keymap.set({ "v", "o" }, "<leader>ti", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects")
        end)
        vim.keymap.set({ "v", "o" }, "<leader>tc", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects")
        end)
        vim.keymap.set({ "v", "o" }, "<leader>tx", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects")
        end)
        vim.keymap.set({ "v", "o" }, "<leader>to", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@conditional.outer", "textobjects")
        end)
        vim.keymap.set({ "v", "o" }, "<leader>tci", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@conditional.inner", "textobjects")
        end)
        vim.keymap.set({ "v", "o" }, "<leader>tl", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@loop.outer", "textobjects")
        end)
        vim.keymap.set({ "v", "o" }, "<leader>tli", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@loop.inner", "textobjects")
        end)
        vim.keymap.set({ "v", "o" }, "<leader>tp", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@parameter.outer", "textobjects")
        end)
        vim.keymap.set({ "v", "o" }, "<leader>tpi", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@paramter.inner", "textobjects")
        end)


    end,
}
