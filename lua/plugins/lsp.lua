return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        { "mason-org/mason.nvim", opts = {} },
        {
            "mason-org/mason-lspconfig.nvim",
            opts = {
                ensure_installed = {
                    "lua_ls",
                    "pyright",
                    "typos_lsp",
                },
            },
        }
    },
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        local on_attach = function(client, bufnr)
            local function map(...)
                vim.api.nvim_buf_set_keymap(bufnr, ...)
            end
            local function opts(desc)
                return { noremap = true, silent = true, desc = desc }
            end

            map("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts("Show documentation"))
            map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts("Previous diagnostic"))
            map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts("Next diagnostic"))
            map("n", "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", opts("Go to definition"))
            map("n", "<leader>lD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts("Go to declaration"))
            map("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts("Go to implementation"))
            map("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts("Go to type definition"))
            map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<cr>", opts("Show references"))
            map("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts("Show signature help"))
            map("n", "<leader>lR", "<cmd>lua vim.lsp.buf.rename()<cr>", opts("Rename symbol"))
            map("n", "<leader>lF", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts("Format code"))
            map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts("Show code actions"))

            if client:supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function() vim.lsp.buf.format() end,
                })
            end
        end

        vim.lsp.config("*", {
            capabilities = capabilities,
            on_attach = on_attach,
        })
    end,
}
