--[[
-- This file will be on charge of providing functionality to put a semicolon [;] or comma [,]
-- at the end of the line either in normal or edit mode
]]

vim.keymap.set("i", "<leader>;", "<Esc>mlA;<Esc>`la", { desc = "Insert semicolon at the end of the line in insert mode" })
vim.keymap.set("n", "<leader>;", "mlA;<Esc>`l", { desc = "Insert semicolon at the end of the line in normal mode" })

vim.keymap.set("i", "<leader><leader>", "<Esc>mlA,<Esc>`la", { desc = "Insert comma at the end of the line in insert mode" })
vim.keymap.set("n", "<leader><leader>", "mlA,<Esc>`l", { desc = "Insert comma at the end of the line in normal mode" })

