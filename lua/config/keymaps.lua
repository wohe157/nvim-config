-- Fast moving
vim.keymap.set({"n", "v"}, "<C-j>", "5j", { desc = "Jump 5 rows down" })
vim.keymap.set({"n", "v"}, "<C-k>", "5k", { desc = "Jump 5 rows up" })

-- Window splitting
vim.keymap.set("n", "<leader>ws", "<C-w>s", { desc = "Split window horizontally" })
vim.keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })

-- Window navigation
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to bottom window" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to top window" })

-- Window resizing
vim.keymap.set("n", "<leader>w<left>",  "<C-w><", { desc = "Decrease window width" })
vim.keymap.set("n", "<leader>w<right>", "<C-w>>", { desc = "Increase window width" })
vim.keymap.set("n", "<leader>w<up>",    "<C-w>+", { desc = "Increase window height" })
vim.keymap.set("n", "<leader>w<down>",  "<C-w>-", { desc = "Decrease window height" })

-- Close window(s)
vim.keymap.set("n", "<leader>wq", "<C-w>c", { desc = "Close current window" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { desc = "Keep only current window" })

-- Tab actions
vim.keymap.set("n", "<leader>tc", ":tabnew<CR>",      { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tq", ":tabclose<CR>",    { desc = "Close current tab" })
vim.keymap.set("n", "<leader>to", ":tabonly<CR>",     { desc = "Keep only current tab" })
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>",     { desc = "Go to next tab" })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { desc = "Go to previous tab" })

-- Buffer actions
vim.keymap.set("n", "<leader>bn", ":bnext<CR>",      { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>",  { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>",    { desc = "Delete current buffer" })
vim.keymap.set("n", "<leader>bl", ":ls<CR>",         { desc = "List buffers" })
vim.keymap.set("n", "<leader>br", ":edit!<CR>",      { desc = "Reload current file from disk" })
vim.keymap.set("n", "<leader>bo", ":%bd|e#|bd#<CR>", { desc = "Close all buffers except current" })
for i = 1, 9 do
  vim.keymap.set("n", "<leader>b" .. i, ":" .. i .. "b<CR>", { desc = "Go to buffer " .. i })
end

-- Terminal actions
vim.keymap.set("n", "<leader>xx", ":split | terminal<CR>i",  { desc = "Open terminal (horizontal)" })
vim.keymap.set("n", "<leader>xv", ":vsplit | terminal<CR>i", { desc = "Open terminal (vertical)" })
vim.keymap.set("n", "<leader>xt", ":tabnew | terminal<CR>i", { desc = "Open terminal (tab)" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]],                { desc = "Exit terminal mode" })

-- Move selected lines with Opt/Alt
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { noremap = true, silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { noremap = true, silent = true })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- UI actions
vim.keymap.set("n", "<leader>ud", function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.disable()
  else
    vim.diagnostic.enable()
  end
end, { desc = "Toggle diagnostics" })

vim.keymap.set("n", "<leader>us", function()
  vim.wo.spell = not vim.wo.spell
end, { desc = "Toggle spell check" })

vim.keymap.set("n", "<leader>ur", function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = "Toggle relative line numbers" })

vim.keymap.set("n", "<leader>uw", function()
  vim.wo.wrap = not vim.wo.wrap
end, { desc = "Toggle line wrap" })
