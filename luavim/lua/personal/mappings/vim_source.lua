--[[
-- Mappings to edit and reload vim configuration
]]
require("functions.register_mappings")

Keymap("n", "<leader>vs", "<cmd>source $MYVIMRC<CR>", { desc = "Source the vim configuration file" })
Keymap("n", "<leader>ve", "<cmd>e $MYVIMRC<CR>", { desc = "Edit the vim configuration file" })
