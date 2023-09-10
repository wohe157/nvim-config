vim.opt.title = true -- Set terminal title to filename
vim.opt.termguicolors = true -- Enable true color support

-- Navigation
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10 -- Keep 10 lines distance to top/bottom

-- Indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Soft wrapping
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "↪ "

-- Vertical rulers
vim.cmd("autocmd FileType * setlocal colorcolumn=80")
vim.cmd("autocmd FileType python setlocal colorcolumn=88")

-- Color scheme
vim.opt.background = "dark"
vim.cmd("colorscheme gruvbox")

