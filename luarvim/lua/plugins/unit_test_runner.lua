--[[
  it automatically runs tests and open a new terminal where it runs
  to complete this feature we use 2 plugins

  1. vim-test it executes the testings and support multiple languages
  check here: https://github.com/vim-test/vim-test

  2. preservim/vimux it will be used to opem a tmux pane instead of a vim pane
  check here: https://github.com/preservim/vimux
--]]
return {
  'vim-test/vim-test',
  dependencies = {
    'preservim/vimux',
  },
  config = function()
    vim.keymap.set("n", "<leader>t", ":TestNearest<CR>", { silent = true })
    vim.keymap.set("n", "<leader>T", ":TestFile<CR>", { silent = true })
    vim.keymap.set("n", "<leader>a", ":TestSuite<CR>", { silent = true })
    vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { silent = true })
    vim.keymap.set("n", "<leader>g", ":TestVisit<CR>", { silent = true })

    vim.cmd("let test#strategy = 'vimux'")
  end
}
