local opts = {
    ensure_installed = {
        "efm",
        -- "html",
        -- "bashls",
    },
    automatic_installation = true,
}

return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    dependencies = "williamboman/mason.nvim",
}
