require("functions.register_mappings")

Keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center cursor" })
Keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center cursor" })
Keymap("n", "n", "nzzv", { desc = "Move to next search result and center cursor" })
Keymap("n", "N", "Nzzv", { desc = "Move to previous search result and center cursor" })
