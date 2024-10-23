--[[
  Auto sessions will automatically save and restore your session when you
  close vim. This is useful when you have a lot of buffers.

  check here:
    https://github.com/rmagatti/auto-session
]]
require("functions.register_mappings")

return {
	"rmagatti/auto-session",
	config = function()
		require("auto-session").setup({
			suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			-- ⚠️ This will only work if Telescope.nvim is installed check the ctrl_p_fuzzy_finder.lua file
			-- The following are already the default values, no need to provide them if these are already the settings you want.
			session_lens = {
				load_on_setup = true,
				previewer = false,
				mappings = {},
				theme_conf = { border = true },
			},
		})

		Keymap(
			"n",
			"<leader>ls",
			require("auto-session.session-lens").search_session,
			{ noremap = true, silent = true, desc = "Search for a session" },
      "auto-session"
		)
	end,
}
