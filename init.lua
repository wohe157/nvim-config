-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Load plugins using Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require("packer").startup(function(use)
    -- Packer itself
    use "wbthomason/packer.nvim"

    -- Color schemes
    use "ellisonleao/gruvbox.nvim"

    -- Fuzzy finder
    use {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        requires = { "nvim-lua/plenary.nvim" }
    }

    -- Git graph
    use {
        "rbong/vim-flog",
        requires = { "tpope/vim-fugitive" }
    }

    -- File browser
    use {
        "nvim-tree/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" }
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)

-- Various simple settings
vim.g.mapleader       = " "    -- Set leader key
vim.opt.number        = true   -- Show line numbers
vim.opt.cursorline    = true   -- Show current line position
vim.opt.title         = true   -- Set terminal title to filename
vim.opt.mouse         = ""     -- Let terminal handle mouse!
vim.opt.scrolloff     = 10     -- Keep 10 lines distance to top/bottom
vim.opt.spell         = true   -- Enable spell checking
vim.opt.linebreak     = true   -- Handle line breaking
vim.opt.termguicolors = true   -- Enable true color support
vim.opt.spelllang     = "en"   -- Set default spelling language
-- Set tab and indentation to 4 spaces
vim.opt.tabstop    = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab  = true

-- Case insensitive searching UNLESS /C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase  = true

-- Color scheme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- Fuzzy finder
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- File browser
require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 40,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
})
