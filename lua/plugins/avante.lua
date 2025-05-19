return {
    "yetone/avante.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
    },
    event = "VeryLazy",
    version = false,
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    opts = {
        mode = "agentic",
        provider = "bedrock",
        bedrock = {
            model = "eu.anthropic.claude-3-7-sonnet-20250219-v1:0",
            aws_profile = "gorilla-tools-formulas",
            aws_region = "eu-west-1",
        }
    },
}
