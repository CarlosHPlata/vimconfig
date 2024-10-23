--[[
  This Lua script defines functions to interact with Neovim using the Telescope plugin.

  Functions:
    - execute_sequence(sequence): Executes a sequence of key presses in Neovim.
    - Print_registered_strings(opts): Uses Telescope to display a list of registered key mappings and allows the user to select and execute one.

  Dependencies:
    - Telescope plugin for Neovim
    - vim.api for Neovim API functions
    - vim.inspect for debugging purposes
]]
require("functions.register_mappings")

local function execute_sequence(sequence)
	local keys = vim.api.nvim_replace_termcodes(sequence, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", true)
end

function Vim_cheat_sheet(opts)
	opts = opts or {}
	local keymap_register = Get_keymap()

	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values

	pickers
		.new(opts, {
			prompt_title = "colors",
			finder = finders.new_table({
				results = keymap_register,
				entry_maker = function(entry)
					return {
						value = entry,
						display = string.format("[%s] %s - %s (%s)", table.concat(entry.mode, ", "), entry.key, entry.desc, entry.plugin),
						ordinal = string.format("[%s] %s - %s (%s)", table.concat(entry.mode, ", "), entry.key, entry.desc, entry.plugin),
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr, _)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					print(vim.inspect(selection))
					execute_sequence(selection.value.action)
				end)
				return true
			end,
		})
		:find()
end
