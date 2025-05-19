-- set leader key
vim.g.mapleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- load lazy
require("config.lazy")

-- Key mappings
require("config.keymaps")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Reserve a space in the gutter for symbols
vim.opt.signcolumn = 'yes'

-- Highlight the cursor line
vim.opt.cursorline = true

-- Keep some space from the top and bottom while scrolling
vim.opt.scrolloff = 15

-- Tabs & indentation
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

-- Better searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false

-- Better splitting behavior
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Disable swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- Wrapping
vim.opt.wrap = false
vim.opt.colorcolumn = "81"

-- Set colorscheme
vim.cmd.colorscheme("kanagawa")

-- Use system clipboard
vim.api.nvim_set_option("clipboard", "unnamed")

-- Custom terminal settings
vim.api.nvim_create_augroup("TerminalSettings", { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
    group = "TerminalSettings",
    pattern = "*",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
    end,
})
