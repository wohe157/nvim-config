return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    config = function()
        require("telescope").setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = "Fuzzy find files" })
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Fuzzy find files" })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live grep in files" })
        vim.keymap.set('n', '<leader>bf', builtin.buffers, { desc = "Fuzzy find buffers" })
    end,
}
