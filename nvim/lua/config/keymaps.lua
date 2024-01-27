local keymap = vim.keymap

-- plugins
keymap.set("n", "<leader>lu", ":Lazy update<CR>")

-- directory nav
keymap.set("n","<leader>fo", ":NvimTreeOpen<CR>", { noremap = true, silent = true})
keymap.set("n","<leader>fc", ":NvimTreeClose<CR>", { noremap = true, silent = true})

-- modes
keymap.set("n", "<leader>tt", ":TransparentToggle<CR>")
keymap.set("n", "<leader>z", ":ZenMode<CR>")

-- multi pane nav
-- figure out later

-- window splitting
keymap.set("n", "<leader>sv", ":vsplit<CR>")
keymap.set("n", "<leader>sh", ":split<CR>")

-- indents
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- comments - gcc and gbc
