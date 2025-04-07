return {
    "lewis6991/gitsigns.nvim",
    config = function()
        local gs = require("gitsigns")

        gs.setup({})

        vim.keymap.set("n", "<leader>gn", gs.next_hunk, { desc = "Next hunk" })
        vim.keymap.set("n", "<leader>gp", gs.prev_hunk, { desc = "Previous hunk" })
        vim.keymap.set("n", "<leader>gh", gs.preview_hunk, { desc = "Preview hunk" })
        vim.keymap.set("n", "<leader>gr", gs.reset_hunk, { desc = "Reset hunk" })
        vim.keymap.set("n", "<leader>gs", gs.stage_hunk, { desc = "Stage hunk" })
        vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame, { desc = "Toggle blame" })
    end,
}
