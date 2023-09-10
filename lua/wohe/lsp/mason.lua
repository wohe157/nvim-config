return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local mason = require("mason")
        local lspconfig = require("mason-lspconfig")

        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        })

        lspconfig.setup({
            ensure_installed = {
                -- LSP
                "clangd", -- C, C++
                "cmake", -- CMake
                "jsonls", -- JSON
                "lemminx", -- XML
                "lua_ls", -- Lua
                "marksman", -- Markdown
                "pyright", -- Python
                "rust_analyzer", -- Rust
                "sqlls", -- SQL
                "taplo", -- TOML
                "tsserver", -- Typescript
                "yamlls", -- YAML
            },
            automatic_installation = true,
        })
    end,
}

