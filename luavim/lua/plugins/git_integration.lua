--[[
 git integrations to add git highlight on changes and also blame
 check here
  https://github.com/lewis6991/gitsigns.nvim

  and also vim-fugitive to show git blame and other git commands
  check here:
    https://github.com/tpope/vim-fugitive
  you can use the command
   :Git
  to use any git command you want
]]
return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("functions.register_mappings")
			require("gitsigns").setup()
			Keymap(
				"n",
				"<leader>gp",
				":Gitsigns preview_hunk<CR>",
				{ desc = "Preview Git hunk [gitsigns.nvim]" },
        "gitsigns.nvim"
			)
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function()
			require("functions.register_mappings")
			Keymap(
				"n",
				"<leader>gb",
				":Git blame<CR>",
				{ desc = "Show Git blame for the current file [vim-fugitive]" },
        "vim-fugitive"
			)
		end,
	},
}
