-- Mappings to move between vim panes with just ctrl and movement keys hjkl
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>", { desc = "Move to the pane above" })
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>", { desc = "Move to the pane below" })
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>", { desc = "Move to the pane to the left" })
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>", { desc = "Move to the pane to the right" })
