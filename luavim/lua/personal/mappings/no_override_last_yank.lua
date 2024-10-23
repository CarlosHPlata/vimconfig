-- You can use this to not override the last register of the clipboard and send the deleted text to the black hole register
require("functions.register_mappings")

Keymap("x", "<leader>p", '"_dP', { desc = "Paste before and send to black hole" })
Keymap("n", "<leader>d", '"_dp', { desc = "Paste after and send to black hole" })
Keymap("v", "<leader>d", '"_dp', { desc = "Paste after and send to black hole" })
