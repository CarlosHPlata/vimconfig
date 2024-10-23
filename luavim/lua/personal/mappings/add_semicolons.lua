--[[
-- This file will be on charge of providing functionality to put a semicolon [;] or comma [,]
-- at the end of the line either in normal or edit mode
]]
require("functions.register_mappings")

Keymap("i", "<leader>;", "<Esc>mlA;<Esc>`la", { desc = "Insert semicolon at the end of the line in insert mode" })
Keymap("n", "<leader>;", "mlA;<Esc>`l", { desc = "Insert semicolon at the end of the line in normal mode" })

Keymap("i", "<leader><leader>", "<Esc>mlA,<Esc>`la", { desc = "Insert comma at the end of the line in insert mode" })
Keymap("n", "<leader><leader>", "mlA,<Esc>`l", { desc = "Insert comma at the end of the line in normal mode" })

