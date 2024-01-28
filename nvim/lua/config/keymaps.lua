local keymap = vim.keymap

-- plugins
keymap.set("n", "<leader>lu", ":Lazy update<CR>", { silent = true} )

-- directory nav
keymap.set("n","<leader>fo", ":NvimTreeOpen<CR>", { noremap = true, silent = true})
keymap.set("n","<leader>fc", ":NvimTreeClose<CR>", { noremap = true, silent = true})

-- modes
keymap.set("n", "<leader>tt", ":TransparentToggle<CR>", {silent = true })
keymap.set("n", "<leader>z", ":ZenMode<CR>", {silent = true})

-- multi pane nav
-- figure out later

-- window splitting
keymap.set("n", "<leader>sv", ":vsplit<CR>", {silent = true})
keymap.set("n", "<leader>sh", ":split<CR>", {silent = true})

-- indents
keymap.set("v", "<", "<gv", {silent = true})
keymap.set("v", ">", ">gv", {silent = true})

-- undo
keymap.set("n", "<leader>u", ":undo<CR>", {silent = true}) 
keymap.set("n", "<leader>r", ":redo<CR>", {silent = true})

-- comments - gcc and gbc
