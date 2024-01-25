local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.lsp").diagnostic_signs

local config = function()
    require("neoconf").setup({})
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local lspconfig = require("lspconfig")

    for type, icon in pairs(diagnostic_signs) do
        local h1 = "DiagnosticSign" .. type
        vim.fn.sign_define(h1, {text = icon, texth1 = h1, numh1 = ""})
    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- python

    lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
            pyright = {
                disableOrganizeImports = false,
                analysis = {
                    useLibraryCodeForTypes = true,
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    autoImportCompletions = true,
                },
            },
        },
    })

    -- bash
    lspconfig.bashls.setup({
        capabilities = capabilities, 
        on_attach = on_attach,
        filetypes = { "sh" },
    })

    -- lua
    lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach, 
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        },
    })


    local shellcheck = require("efmls-configs.linters.shellceck")
    local flake8 = require("efmls-config.linters.flake8")
    local black = require("efmls-config.formatters.black")
    local shfmt = require("efmls-config.formatters.shfmt")
    local alex = require("efmls-config.linters.alex")
    local prettierd = require("efmls-config.formatters.prettier_d")


    -- efm config
    lspconfig.efm.setup({
        filetypes = {
            "python",
            "sh",
            "markdown",
        },
        init_options = {
            documentFormatting = true,
            documentRangeFormatting = true,
            hover = true,
            documentSymbol = true,
            codeAction = true,
            completion = true,
        },
        settings = {
            languages = {
                python = { flake8, black },
                sh = { shellcheck, shfmt },
                markdown = { alex, prettierd },
            },
        },
    })
end

return {
    "neovim/nvim-lspconfig",
    config = config,
    lazy = false,
    dependencies = {
        "windwp/nvim-autopairs",
        "williamboman/mason.nvim",
        "creativenull/efmls-configs-nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
    },
}
