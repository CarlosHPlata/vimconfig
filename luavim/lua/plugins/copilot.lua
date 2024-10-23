--[[
  As the name suggest let's add copilot to nvim

  first of the pluggins of course is Github copilot is just what you expect
  autocompletion of code and detection
  check here:
    https://github.com/github/copilot.vim

  After installation remember to run
    :Copilot setup

  The second pluggin is CopilotChat which is a chat for copilot
  check here:
    https://github.com/CopilotC-Nvim/CopilotChat.nvim
]]
require("functions.register_mappings")

return {
	{
		"github/copilot.vim",
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"github/copilot.vim",
		},
		build = "make tiktoken", -- only for MacOS or Linux
		config = function()
			require("CopilotChat").setup({
				debug = false, -- Enable debug logging
			})

			Keymap({ "n", "v" }, "<leader>cop", function()
				local input = vim.fn.input("Ask copilot: ")
				if input ~= "" then
					return "<cmd>CopilotChat<space>" .. input .. "<cr>"
				end
			end, { expr = true, desc = "Ask copilot" }, "CopilotChat")

			Keymap({ "n", "v" }, "<leader>cof", function()
				local input = vim.fn.input("[File] Ask copilot: ")
				if input ~= "" then
					require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
				end
			end, { desc = "Ask copilot for a file" }, "CopilotChat")

			Keymap({ "n", "v" }, "<leader>coh", function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
			end, { desc = "Ask copilot for a help" }, "CopilotChat")
		end,
	},
}
