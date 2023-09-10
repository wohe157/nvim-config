return {
    "petertriho/nvim-scrollbar",
    dependencies = {
        "lewis6991/gitsigns.nvim",
    },
    config = function()
        require("gitsigns").setup()
        require("scrollbar").setup()
    end,
}

