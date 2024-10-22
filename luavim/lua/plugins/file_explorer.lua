-- neo tree opens a file system explorer in a new window like any other editor
-- check: https://github.com/nvim-neo-tree/neo-tree.nvim
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.keymap.set("n", "<leader>nt", ":Neotree toggle<CR>", { desc = "Toggle Neotree file explorer [neo-tree.nvim]" })

		require("neo-tree").setup({
			event_handlers = {
				{
					event = "file_open_requested",
					handler = function()
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})
	end,
}
