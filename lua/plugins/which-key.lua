return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
        local wk = require("which-key")

        wk.setup({
            preset = "helix",
        })

        wk.add({
            {"<leader>a", group = "ai"}
            {"<leader>b", group = "buffer"},
            {"<leader>f", group = "file"},
            {"<leader>l", group = "lsp"},
            {"<leader>g", group = "git"},
            {"<leader>t", group = "tab"},
            {"<leader>u", group = "ui"},
            {"<leader>w", group = "window"},
            {"<leader>x", group = "terminal"},
        })
    end,
}
