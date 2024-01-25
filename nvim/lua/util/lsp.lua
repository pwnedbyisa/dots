keymap = vim.keymap

local M = {}

M.on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    if client.name == "pyright" then
        keymap("n", "<leader>oi", ":PyrightOrganizeImports<CR>", opts)
    end
end

return M 
