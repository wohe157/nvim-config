return {
    "neovim/nvim-lspconfig",
    dependencies = {
        -- TODO: fix workaround (https://github.com/LazyVim/LazyVim/issues/6039)
        { "mason-org/mason.nvim", version = "^1.0.0" },
        { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
    },
    config = function()
        -- Install LSPs
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "pyright",
                "typos_lsp",
            },
        })

        -- Configure LSPs
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

        -- Set key bindings
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', {buffer = event.buf, desc = "Show documentation"})
                vim.keymap.set('n', '<leader>ld', '<cmd>lua vim.lsp.buf.definition()<cr>', {buffer = event.buf, desc = "Go to definition"})
                vim.keymap.set('n', '<leader>lD', '<cmd>lua vim.lsp.buf.declaration()<cr>', {buffer = event.buf, desc = "Go to declaration"})
                vim.keymap.set('n', '<leader>li', '<cmd>lua vim.lsp.buf.implementation()<cr>', {buffer = event.buf, desc = "Go to implementation"})
                vim.keymap.set('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<cr>', {buffer = event.buf, desc = "Go to type definition"})
                vim.keymap.set('n', '<leader>lr', '<cmd>lua vim.lsp.buf.references()<cr>', {buffer = event.buf, desc = "Show references"})
                vim.keymap.set('n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<cr>', {buffer = event.buf, desc = "Show signature help"})
                vim.keymap.set('n', '<leader>lR', '<cmd>lua vim.lsp.buf.rename()<cr>', {buffer = event.buf, desc = "Rename symbol"})
                vim.keymap.set('n', '<leader>lF', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', {buffer = event.buf, desc = "Format code"})
                vim.keymap.set('n', '<leader>la', '<cmd>lua vim.lsp.buf.code_action()<cr>', {buffer = event.buf, desc = "Show code actions"})
            end,
        })
    end,
}
