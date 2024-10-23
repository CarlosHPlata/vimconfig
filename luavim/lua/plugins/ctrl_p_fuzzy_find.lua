--[[
  Let you fuzzy find and greep your files as like the ctrl-p from visual studio code
  here:
  https://github.com/nvim-telescope/telescope.nvim

  to use this pluggin you have to install with brew the following pluggins:
  https://github.com/BurntSushi/ripgrep

  And this one for better experience:
  hhttps://github.com/sharkdp/fdttps://github.com/sharkdp/fd

  the second pluggin telescope-ui-select.nvim is just a theme to support telescope ui when triggering ui-select
  here:
  https://github.com/nvim-telescope/telescope-ui-select.nvim
--]]
return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("functions.register_mappings")
      local builtin = require("telescope.builtin")

      Keymap("n", "<C-p>", builtin.git_files, { desc = "Telescope find git files" }, "telescope.nvim")
      Keymap("n", "<C-P>", builtin.find_files, { desc = "Telescope find files" }, "telescope.nvim")
      Keymap("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" }, "telescope.vim")
      Keymap("n", "<leader>fb", builtin.buffers, { desc = "Telescope vim buffers" }, "telescope.vim")
      -- Keymap('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' }, 'telescope.vim')
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
