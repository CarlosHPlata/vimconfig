-- as the name suggest it let you move between vim panes and tmux panes
-- check https://github.com/christoomey/vim-tmux-navigator
return {
  "christoomey/vim-tmux-navigator",
  config = function()
    vim.keymap.set("n", "<c-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate to the left tmux pane [vim-tmux-navigator]" })
    vim.keymap.set("n", "<c-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate to the bottom tmux pane [vim-tmux-navigator]" })
    vim.keymap.set("n", "<c-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate to the top tmux pane [vim-tmux-navigator]" })
    vim.keymap.set("n", "<c-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate to the right tmux pane [vim-tmux-navigator]" })
    vim.keymap.set("n", "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>", { desc = "Navigate to the previous tmux pane [vim-tmux-navigator]" })
  end,
}
