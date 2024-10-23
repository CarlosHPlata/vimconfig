-- Define a global table to store registered strings
local keymap_register = {}

-- Function to register a string into the global table
function Keymap(mode, key, action, opts, plugin)
	-- Ensure mode is a table
	local modeTable = type(mode) == "string" and { mode } or mode
	-- Check if action is a function
	local actionValue = type(action) == "function" and "function" or action

	local newAction = {
		mode = modeTable,
		key = key,
		action = actionValue,
		desc = opts.desc,
    plugin = plugin or "none"
	}

	vim.keymap.set(modeTable, key, action, opts)
	table.insert(keymap_register, newAction)
end

function Get_keymap()
  return keymap_register
end

