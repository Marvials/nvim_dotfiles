return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- Adapters
        "nvim-neotest/neotest-go",
        "nvim-neotest/neotest-python",
        "nvim-neotest/neotest-jest",
        "nvim-neotest/neotest-plenary",
    },
    config = function()
        local neotest = require("neotest")

        neotest.setup({
            adapters = {
                require("neotest-go")({
                    experimental = {
                        test_table = true,
                    },
                    args = { "-count=1", "-timeout=60s" }
                }),
                require("neotest-python")({
                    dap = { justMyCode = false },
                }),
                require("neotest-jest")({
                    jestCommand = "npm test --",
                    jestConfigFile = "custom.jest.config.ts",
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.getcwd()
                    end,
                }),
                require("neotest-plenary"),
            },
            -- Configuration for the output window
            output = {
                enabled = true,
                open_on_run = true,
            },
            -- Configuration for the summary window
            summary = {
                enabled = true,
                animated = true,
                follow = true,
                expand_errors = true,
            },
        })

        -- Keymaps
        vim.keymap.set("n", "<leader>tm", function() neotest.run.run() end, { desc = "Test Method (Nearest)" })
        vim.keymap.set("n", "<leader>tM", function() neotest.run.run({strategy = "dap"}) end, { desc = "Debug Method (Nearest)" })
        vim.keymap.set("n", "<leader>tf", function() neotest.run.run(vim.fn.expand("%")) end, { desc = "Test File" })
        vim.keymap.set("n", "<leader>ta", function() neotest.run.run(vim.loop.cwd()) end, { desc = "Test All (Project)" })
        vim.keymap.set("n", "<leader>ts", function() neotest.summary.toggle() end, { desc = "Toggle Test Summary" })
        vim.keymap.set("n", "<leader>to", function() neotest.output.open({ enter = true }) end, { desc = "Show Test Output" })
        vim.keymap.set("n", "<leader>tp", function() neotest.output_panel.toggle() end, { desc = "Toggle Output Panel" })
    end,
}
