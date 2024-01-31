return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        cmdline = {
            enabled = true,
            view = "cmdline", -- puts cmdline at the bottom
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
}
