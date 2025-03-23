-- set leader key
vim.g.mapleader = " "

-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- load lazy
require("config.lazy")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = false

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
vim.o.wrap = false

-- Key mappings
vim.keymap.set('n', '<leader>qq', ":q<CR>", { desc = "Close buffer" })
vim.keymap.set('n', '<leader>qw', ":wq<CR>", { desc = "Save and close buffer" })
vim.keymap.set('n', '<leader>sv', ":vsplit<CR>", { desc = "Split vertical" })
vim.keymap.set('n', '<leader>sh', ":split<CR>", { desc = "Split horizontal" })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Set colorscheme
vim.cmd.colorscheme("kanagawa")

-- Use system clipboard
vim.api.nvim_set_option("clipboard", "unnamed")
