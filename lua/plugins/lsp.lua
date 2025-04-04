return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup({})

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "typos_lsp",
            },
        })

        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup({})

        lspconfig.pyright.setup({
            on_attach = function(client, _)
                client.server_capabilities.codeActionProvider = false
            end,
            handlers = {
                -- diagnostics are handled by black and flake8 in ALE
                ["textDocument/publishDiagnostics"] = function() end,
            },
            settings = {
                pyright = {
                    disableOrganizeImports = true,  -- handled by isort in ALE
                },
                python = {
                    analysis = {
                        typeCheckingMode = "off",  -- handled by mypy in ALE
                    },
                },
            },
        })

        lspconfig.typos_lsp.setup({})
    end,
}
