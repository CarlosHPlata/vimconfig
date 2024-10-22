--[[
  it automatically runs tests and open a new terminal where it runs
  to complete this feature we use 2 plugins

  1. vim-test it executes the testings and support multiple languages
  check here: https://github.com/vim-test/vim-test

  2. preservim/vimux it will be used to opem a tmux pane instead of a vim pane
  check here: https://github.com/preservim/vimux
--]]
return {
	"vim-test/vim-test",
	dependencies = {
		"preservim/vimux",
	},
	config = function()
		vim.keymap.set(
			"n",
			"<leader>t",
			":TestNearest<CR>",
			{ silent = true, desc = "Run the nearest test [vim-test]" }
		)
		vim.keymap.set(
			"n",
			"<leader>T",
			":TestFile<CR>",
			{ silent = true, desc = "Run all tests in the current file [vim-test]" }
		)
		vim.keymap.set(
			"n",
			"<leader>a",
			":TestSuite<CR>",
			{ silent = true, desc = "Run the entire test suite [vim-test]" }
		)
		vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { silent = true, desc = "Run the last test [vim-test]" })
		vim.keymap.set(
			"n",
			"<leader>g",
			":TestVisit<CR>",
			{ silent = true, desc = "Visit the last test file [vim-test]" }
		)
		vim.cmd("let test#strategy = 'vimux'")
	end,
}
