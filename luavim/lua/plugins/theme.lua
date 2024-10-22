-- An overal theme for neovim
-- check: https://github.com/catppuccin/nvim
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin"
  end,
}
