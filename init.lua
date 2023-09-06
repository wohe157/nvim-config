-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("wohe")

-- Various simple settings
vim.g.mapleader = " " -- Set leader key
vim.opt.mouse = "" -- Disable mouse interaction
vim.opt.spell = true -- Enable spell checking
vim.opt.spelllang = "en" -- Set default spelling language

