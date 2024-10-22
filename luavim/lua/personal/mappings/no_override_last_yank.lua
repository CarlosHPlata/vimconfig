-- You can use this to not override the last register of the clipboard and send the deleted text to the black hole register
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste before and send to black hole" })
vim.keymap.set("n", "<leader>d", '"_dp', { desc = "Paste after and send to black hole" })
vim.keymap.set("v", "<leader>d", '"_dp', { desc = "Paste after and send to black hole" })
