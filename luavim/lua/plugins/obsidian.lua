--[[
  Obsidian is a note taking app designed around md files, it use a vault to store all the notes
  this plugin will allow you to open your vault in neovim and edit your notes in markdown
  this is an option if you don't have the app installed or you want to use neovim to edit your notes

  of course the recomendation is to use the app itself but this could help you in environments where
  you can't install the app or you want to use neovim to edit your notes

  !!IS IMPORTANT THAT YOU CONFIGURE THIS PLUGIN CORRECTLY TO WORK WITH YOUR VAULT.

  check this:
  https://github.com/epwalsh/obsidian.nvim
--]]

return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
	--   -- refer to `:h file-pattern` for more examples
	--   "BufReadPre path/to/my-vault/*.md",
	--   "BufNewFile path/to/my-vault/*.md",
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/projects/notes-vault",
			},
		},
		daily_notes = {
			folder = "log",
			template = "DailyLog.md",
		},
		templates = {
			folder = "_Obsidian/templates",
		},
    picker = {
      name = "telescope.nvim",
    }
	},
}
