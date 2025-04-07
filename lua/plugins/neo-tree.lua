return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    lazy = false,
    config = function()
        require("neo-tree").setup({
            default_component_configs = {
                symlink_target = {
                    enabled = true,
                },
            },
            filesystem = {
                window = {
                    position = "float",
                },
                hide_statusline = true,
                filtered_items = {
                    visible = true,
                },
            },
        })

	    vim.keymap.set("n", "<leader>fe", "<Cmd>Neotree<CR>", { desc = "Open file browser (Neotree)" })
    end,
}
