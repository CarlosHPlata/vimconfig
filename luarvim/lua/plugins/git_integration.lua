--[[
 git integrations to add git highlight on changes and also blame
 check here
  https://github.com/lewis6991/gitsigns.nvim
]]
return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
		end,
	},
	{
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
    end
  },
}
