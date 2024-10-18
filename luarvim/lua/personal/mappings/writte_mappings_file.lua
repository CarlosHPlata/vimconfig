local FILE_NAME = "key_mappings.json"

-- Function to encode a Lua table into JSON format
local function encode_to_json(tbl)
	local function escape_str(s)
		return s:gsub("\\", "\\\\"):gsub('"', '\\"'):gsub("\n", "\\n"):gsub("\r", "\\r")
	end

	local function encode(tbl)
		local result = {}
		local t = type(tbl)
		if t == "table" then
			local is_array = #tbl > 0
			if is_array then
				for _, v in ipairs(tbl) do
					table.insert(result, encode(v))
				end
				return "[" .. table.concat(result, ",") .. "]"
			else
				for k, v in pairs(tbl) do
					table.insert(result, '"' .. escape_str(tostring(k)) .. '":' .. encode(v))
				end
				return "{" .. table.concat(result, ",") .. "}"
			end
		elseif t == "string" then
			return '"' .. escape_str(tbl) .. '"'
		elseif t == "number" or t == "boolean" then
			return tostring(tbl)
		else
			return "null"
		end
	end

	return encode(tbl)
end

-- Function to write key mappings for n, v, i modes to a .txt file in JSON format
local function write_mappings_to_file()
	local modes = { "n", "v", "i" }
	local filtered_mappings = {}

	for _, mode in ipairs(modes) do
		local mappings = vim.api.nvim_get_keymap(mode)
		for _, map in ipairs(mappings) do
			table.insert(filtered_mappings, {
				mode = mode,
				lhs = map.lhs,
				rhs = map.rhs,
				desc = map.desc,
			})
		end
	end

	local json_mappings = encode_to_json(filtered_mappings)
	local file_path = vim.fn.stdpath("config") .. "/" .. FILE_NAME
	local file = io.open(file_path, "w")
	if file then
		file:write(json_mappings)
		file:close()
		print("Key mappings written to " .. file_path)
	else
		print("Error: Unable to open file for writing")
	end
end

-- Call the function to write the mappings to the file
vim.keymap.set({ "n" }, "<leader>vw", write_mappings_to_file, {})
