return {
    'nvim-java/nvim-java',
    config = function ()
        require('java').setup()
        
        -- DESATIVAR SEMANTIC TOKENS: Isso impede que o LSP do Java deixe tudo branco
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client.name == "jdtls" then
                    client.server_capabilities.semanticTokensProvider = nil
                end
            end,
        })

        vim.lsp.enable('jdtls')
    end,
}
