--[[
  Let you fuzzy find and greep your files as like the ctrl-p from visual studio code
  here:
  https://github.com/nvim-telescope/telescope.nvim

  the second pluggin telescope-ui-select.nvim is just a theme to support telescope ui when triggering ui-select
  here:
  https://github.com/nvim-telescope/telescope-ui-select.nvim
--]]
return {
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files'})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      -- vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope vim buffers' })
      -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  },
}
