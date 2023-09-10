return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            sort_by = "case_sensitive",
            view = {
                width = 60,
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
        })

        vim.keymap.set("n", "<leader>et", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file browser" })
        vim.keymap.set("n", "<leader>ef", "<cmd>NvimTreeFocus<cr>", { desc = "Focus file browser" })
    end,
}

