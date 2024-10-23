-- Mappings to move between vim panes with just ctrl and movement keys hjkl
require("functions.register_mappings")

Keymap("n", "<c-k>", ":wincmd k<CR>", { desc = "Move to the pane above" })
Keymap("n", "<c-j>", ":wincmd j<CR>", { desc = "Move to the pane below" })
Keymap("n", "<c-h>", ":wincmd h<CR>", { desc = "Move to the pane to the left" })
Keymap("n", "<c-l>", ":wincmd l<CR>", { desc = "Move to the pane to the right" })
