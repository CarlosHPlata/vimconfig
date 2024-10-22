--[[
-- Mappings to edit and reload vim configuration
]]

vim.keymap.set("n", "<leader>vs", "<cmd>source $MYVIMRC<CR>", { desc = "Source the vim configuration file" })
vim.keymap.set("n", "<leader>ve", "<cmd>e $MYVIMRC<CR>", { desc = "Edit the vim configuration file" })
