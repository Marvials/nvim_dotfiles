local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("core.options")
require("core.keymaps")

local plugins = {
    require("plugins.colorscheme"),
    require("plugins.auto-pairs"),
    require("plugins.neotree"),
    require("plugins.snacks"),
    require("plugins.todo-comments"),
    require("plugins.auto-sessions"),
    require("plugins.telescope"),
    require("plugins.undertree"),
    require("plugins.init"),
    require("plugins.harpoon"),
    require("plugins.mini"),
    require("plugins.treesitter"),
    require("plugins.bufferline"),
    require("plugins.lualine"),
    require("plugins.wilder"),
    require("plugins.showkey"),
    require("plugins.vim-maximizer"),
    require("plugins.git"),
    require("plugins.gitworktree"),
    require("plugins.nvim-cmp"),
    require("plugins.tailwind-tools"),
    require("plugins.lsp.mason"),
    require("plugins.lsp.lspconfig"),
    require("plugins.noice"),
    require("plugins.linting"),
    require("plugins.formatting"),
    require("plugins.trouble"),
    require("plugins.emmet"),
    require("plugins.image-support"),
    require("plugins.render-markdown"),
    require("plugins.nvim-ufo"),
    require("plugins.flash"),
    require("plugins.debugging"),
}

local opts = {
}

require("lazy").setup(plugins, opts)
