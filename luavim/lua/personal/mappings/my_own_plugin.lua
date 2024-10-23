--[[
  this is my own plugin

  with this you can check all the keymaps that you have registered
--]]
require("functions.register_mappings")
require("functions.cheatsheet")

Keymap("n", "<leader>csm", function()
  Vim_cheat_sheet()
end, { desc = "Print all the keymaps registered" })
