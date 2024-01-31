local keymap = vim.keymap

-- movement remapping <3
-- :set whichwrap+=h,l

-- plugins
keymap.set("n", "<leader>lu", ":Lazy update<CR>", { silent = true} )

-- directory nav
keymap.set("n","<leader>fo", ":NvimTreeOpen<CR>", { noremap = true, silent = true})
keymap.set("n","<leader>fc", ":NvimTreeClose<CR>", { noremap = true, silent = true})
keymap.set("n", "<leader>oi", ":Oil --float<CR>", { noremap = true, silent = true }) 

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

-- quit
keymap.set("n", "<leader>q", ":q<CR>", {silent = true})
keymap.set("n", "<leader>wq", ":wq<CR>", {silent = true})
keymap.set("n", "<leader>fq", ":q!<CR>", {silent = true})

-- comments - gcc and gbc
