--[[
  This configuration file sets up various Vim options to enhance the editing experience.
]]

vim.cmd("set expandtab")        -- Set to use spaces instead of tabs
vim.cmd("set tabstop=2")        -- Set tab width to 2 spaces
vim.cmd("set softtabstop=2")    -- Set the number of spaces that a <Tab> counts for while performing editing operations
vim.cmd("set shiftwidth=2")     -- Set the number of spaces to use for each step of (auto)indent

vim.cmd("set mouse=a")          -- Enable mouse support in all modes

-- NOTE: some systems like wsl2 may not have the en_US locale and have to use the utf-8 version
-- or viseversa
-- vim.cmd("language en_US")      -- Set the language to US English
vim.cmd("language en_US.UTF-8")   -- Set the language to US English with UTF-8 encoding

vim.cmd("set cursorline")       -- Highlight the screen line of the cursor with CursorLine
vim.cmd("set numberwidth=1")    -- Set the number column width to 1
vim.cmd("set clipboard+=unnamedplus") -- Use the system clipboard for all operations
vim.cmd("syntax enable")       -- Enable syntax highlighting
vim.cmd("set showcmd")          -- Show (partial) command in the last line of the screen
vim.cmd("set encoding=utf-8")   -- Set the encoding to UTF-8
vim.cmd("set number")           -- Show line numbers

