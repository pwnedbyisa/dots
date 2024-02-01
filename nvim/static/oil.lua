-- not using atm
local config = function()
    require('oil').setup({
        columns = {
            "icon",
            "permissions",
            "size",
        },
        float = {
            -- Padding around the floating window
            padding = 20,
            max_width = 70,
            max_height = 0,
            border = "rounded",
            win_options = {
                winblend = 0,
            },
            override = function(conf)
                return conf
            end,
        },
    })
end

return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = config,
    lazy = false,
}
