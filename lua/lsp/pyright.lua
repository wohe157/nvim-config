return {
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
}
