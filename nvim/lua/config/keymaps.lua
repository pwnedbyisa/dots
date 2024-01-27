local keymap = vim.keymap
        
-- directory nav
keymap.set("n","<leader>fo", ":NvimTreeOpen<CR>", { noremap = true, silent = true})
keymap.set("n","<leader>fc", ":NvimTreeClose<CR>", { noremap = true, silent = true})

-- transparent mode
keymap.set("n", "<leader>tt", ":TransparentToggle<CR>")

-- multi pane nav
-- figure out later

-- window splitting
keymap.set("n", "<leader>sv", ":vsplit<CR>", opts)
keymap.set("n", "<leader>sh", ":split<CR>", opts)

-- indents
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- comments - literally does not work but wtv
vim.api.nvim_set_keymap("n", "<C-/>", "gtc", { noremap = false })
vim.api.nvim_set_keymap("v", "<C-/>", "goc", { noremap = false })
